import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:moor_demo/core/moor_database/moor_data_manager.dart';
import 'package:moor_demo/core/moor_database/moor_database.dart';
import '../../../../core/network_connnectivity.dart';
import '../../../../core/retrofit/rest_client.dart';
import '../models/response_model.dart';
import 'users_local_src.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class UsersLocalSrcImpl extends UsersLocalSrc {
  late RestClient restClient;
  DemoMoorDatabase? moorDatabase;

  @override
  Future<List<Result>> getUsers() async {
    List<Result>? list;
    NetworkCheck networkCheck = NetworkCheck();
    bool isInternetAvailable = await networkCheck.check();
    if (isInternetAvailable) {
      // Save and return from Server
      list = await getUsersFromServer().single;
    } else {
      // Fetch from Database
      list = await getResponseFromDb();
    }
    return list;
  }



  Future initRestClient({bool refreshToken = false}) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(responseBody: true));
    restClient = (RestClient(dio));
  }

  Stream<List<Result>> getUsersFromServer() {
    return Stream.fromFuture(initRestClient())
        .flatMap((value) => Stream.fromFuture(deleteAllRecords()))
        .flatMap((data) {
          return RetryWhenStream(() => Stream.fromFuture(restClient.getUsers()),
              (e, s) async* {
            yield* Stream.error(e);
          });
        })
        .map((value) {
          return value.results;
        })
        .flatMapIterable((value) => Stream.value(value))
        .flatMap((result) => Stream.fromFuture(saveResponseItem(result)))
        .toList()
        .asStream()
        .map((event) {
          debugPrint('Final List :: ${event.toList().length}');
          return event.toList();
        })
        .flatMap((event) => Stream.fromFuture(getResponseFromDb()))
        .map((dbList) {
          debugPrint('Final List  DB :: ${dbList.length}');
          return dbList;
        });
  }

  Future<Result> saveResponseItem(Result result) async {
    moorDatabase = DemoDbManager.instance.getDbInstance();
    moorDatabase!.userDao.insertUsers(jsonEncode(result));
    return result;
  }

  Future<List<Result>> getResponseFromDb() async {
    moorDatabase = DemoDbManager.instance.getDbInstance();
    var data = await moorDatabase!.userDao.getAllUsers();
    List<Result> list = [];
    if (data.isNotEmpty) {
      for (var element in data) {
        Result model = Result.fromJson(jsonDecode(element.user));
        list.add(model);
      }
      debugPrint('Fetching from db ... ${list.length}');
    } else {
      debugPrint('No records in Db');
    }
    return list;
  }

  Future<void> deleteAllRecords() async {
    moorDatabase = DemoDbManager.instance.getDbInstance();
    var data = await moorDatabase!.userDao.deleteAllRecords();
    debugPrint('All Records deleted ---- > $data');
  }
}

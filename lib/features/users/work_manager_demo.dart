import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moor_demo/core/common.dart';
import 'package:moor_demo/features/users/data/datasource/users_local_src.dart';
import 'package:moor_demo/features/users/data/datasource/users_local_src.impl.dart';
import 'package:moor_demo/features/users/data/repositories/users_repositories_impl.dart';
import 'package:moor_demo/features/users/domain/repositories/user_repositories.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackground = "fetchBackground";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackground:
        // Code to run in background
        Common.showToast(msg: 'Fetched from background');
        UsersLocalSrc usersLocalSrc = UsersLocalSrcImpl();
        usersLocalSrc.getUsers(true);
        break;
    }
    return Future.value(true);
  });
}

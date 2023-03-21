import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../features/users/data/models/response_model.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("https://randomuser.me/api/?results=100")
  Future<ResponseModel> getUsers();
}

import 'package:dio/dio.dart';
import 'package:exam/viewmodel/services/network/endpoints.dart';

class Diohelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseurl,
        receiveDataWhenStatusError: true,
        queryParameters: {'api_key': api_key}));
  }

   static Future <Response?> get({
    required String endpoints,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response;
      response = await dio.get(endpoints, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
    ;
  }
}

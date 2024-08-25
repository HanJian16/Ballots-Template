import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.0.10:3000',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 3),
          ),
        );
  Future<Response> getUsers() async {
    try {
      return await dio.get('/users');
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postSore(Map<String, dynamic> storeData) async {
    try {
      return await dio.post('/users', data: storeData);
    } catch (e) {
      rethrow;
    }
  }
}

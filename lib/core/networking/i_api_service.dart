import 'package:dio/dio.dart';

abstract class IApiService {
  void initialize();
  Future<Response> post(String path, {dynamic data, Options? options});
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters});
  Future<Response> put(String path, {dynamic data, Options? options});
  Future<Response> patch(String path, {dynamic data, Options? options});
  Future<Response> delete(String path, {dynamic data, Options? options});
}
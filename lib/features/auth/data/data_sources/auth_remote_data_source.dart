import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> login(String email, String password) async {
    final String url = ApiConstants.login;

    try {
      print("email $email");
      print("password $password");

      final Response response = await dio.post(
        url,
        data: {'email': email, 'password': password},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      // 401 Unauthorized or other server errors
      if (e.response != null && e.response?.data != null) {
        final data = e.response!.data;
        if (data is Map && data.containsKey('message')) {
          throw Exception(data['message']);
        } else if (data is Map && data.containsKey('error')) {
          throw Exception(data['error']);
        }
      }
      if (e.response?.statusCode == 401 || e.response?.statusCode == 404) {
        throw Exception('البريد الإلكتروني أو كلمة المرور غير صحيحة');
      }
      throw Exception('حدث خطأ في الاتصال بالخادم');
    } catch (error) {
      throw Exception('حدث خطأ غير متوقع: $error');
    }
  }
}

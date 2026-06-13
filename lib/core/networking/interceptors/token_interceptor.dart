import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/token_manager/token_manager.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends QueuedInterceptor {
  final Dio dio;
  final ITokenManager tokenManager;
  bool _isRefreshing = false;

  TokenInterceptor({
    required this.dio,
    required this.tokenManager,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!_isRefreshRequest(options)) {
      final token = await tokenManager.getAccessToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401 ||
        _isRefreshRequest(err.requestOptions) ||
        _isRefreshing) {
      return handler.next(err);
    }

    _isRefreshing = true;

    try {
      final refreshSuccess = await _refreshToken();
      if (refreshSuccess) {
        final response = await _retryRequest(err.requestOptions);
        return handler.resolve(response);
      } else {
        await tokenManager.deleteTokens();
        return handler.next(err);
      }
    } catch (e) {
      await tokenManager.deleteTokens();
      return handler.next(err);
    } finally {
      _isRefreshing = false;
    }
  }

  // ----- will need to edit when backend finish endpoints -----
  
  bool _isRefreshRequest(RequestOptions options) {
    return options.path.contains(ApiConstants.authRefresh) ||
        options.path.contains(ApiConstants.login);
  }

  Future<bool> _refreshToken() async {
    final refreshToken = await tokenManager.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) return false;

    try {
      final response = await dio.post(
        ApiConstants.authRefresh,
        data: {'refresh_token': refreshToken},
        options: Options(headers: {'skip_interceptor': true}), // Avoid interceptor on refresh request if needed
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['access_token'];
        final newRefreshToken = response.data['refresh_token'];
        
        if (newAccessToken != null) {
          await tokenManager.saveAccessToken(newAccessToken);
        }
        if (newRefreshToken != null) {
          await tokenManager.saveRefreshToken(newRefreshToken);
        }
        return true;
      }
    } catch (e) {
      // If refresh fails with 401, it will be caught here if it's a DioException
      return false;
    }
    return false;
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final token = await tokenManager.getAccessToken();
    if (token != null && token.isNotEmpty) {
      requestOptions.headers['Authorization'] = 'Bearer $token';
    }
    return dio.fetch(requestOptions);
  }
}

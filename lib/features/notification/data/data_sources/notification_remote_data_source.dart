import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/features/notification/data/models/notification_model.dart';
import 'package:dio/dio.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final Dio dio;

  NotificationRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NotificationModel>> getNotifications() async {
    // TODO: Update the endpoint when the backend is ready
    final String url = '${ApiConstants.baseURL}/notifications';

    try {
      final Response response = await dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': 'Bearer ...' // Add token if required
          },
        ),
      );

      final List data = response.data['data'] ?? [];
      return data.map((json) => NotificationModel.fromJson(json)).toList();
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        final data = e.response!.data;
        if (data is Map && data.containsKey('message')) {
          throw Exception(data['message']);
        } else if (data is Map && data.containsKey('error')) {
          throw Exception(data['error']);
        }
      }
      throw Exception('حدث خطأ في الاتصال بالخادم');
    } catch (error) {
      throw Exception('حدث خطأ غير متوقع: $error');
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/core/utils/errors/server_failure.dart';
import 'package:day_i/features/chatbot/data/data_source/chatbot_remote_data_source.dart';
import 'package:day_i/features/chatbot/data/model/chatbot_model.dart';
import 'package:dio/dio.dart';

class ChatbotRemoteDataSourceImpl implements ChatbotRemoteDataSource {
  final IApiService _apiService;

  ChatbotRemoteDataSourceImpl({required IApiService apiService}) : _apiService = apiService;

  @override
  Future<Either<Failure, ChatbotModel>> sendMessage(String message, String lang) async {
    final result = await _apiService.post(
      '/chatbot',
      queryParameters: {'lang': lang},
      data: {'message': message},
      options: Options(headers: {'Accept-Language': lang}),
    );

    return result.fold(
      (failure) => Left(failure),
      (response) {
        if (response.data['success'] == true) {
          return Right(ChatbotModel.fromJson(response.data['data']));
        } else {
          return Left(ServerFailure('Failed to send message'));
        }
      },
    );
  }
}

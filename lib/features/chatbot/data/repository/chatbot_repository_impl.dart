import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/chatbot/data/data_source/chatbot_remote_data_source.dart';
import 'package:day_i/features/chatbot/domain/entity/chatbot_entity.dart';
import 'package:day_i/features/chatbot/domain/repository/chatbot_repository.dart';

class ChatbotRepositoryImpl implements ChatbotRepository {
  final ChatbotRemoteDataSource _remoteDataSource;

  ChatbotRepositoryImpl({required ChatbotRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, ChatbotEntity>> sendMessage(String message, String lang) async {
    return await _remoteDataSource.sendMessage(message, lang);
  }
}

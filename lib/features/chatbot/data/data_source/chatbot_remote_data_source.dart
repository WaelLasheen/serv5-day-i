import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/chatbot/data/model/chatbot_model.dart';

abstract class ChatbotRemoteDataSource {
  Future<Either<Failure, ChatbotModel>> sendMessage(String message, String lang);
}

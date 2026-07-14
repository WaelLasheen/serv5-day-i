import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/chatbot/domain/entity/chatbot_entity.dart';

abstract class ChatbotRepository {
  Future<Either<Failure, ChatbotEntity>> sendMessage(String message, String lang);
}

import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/chatbot/domain/entity/chatbot_entity.dart';
import 'package:day_i/features/chatbot/domain/repository/chatbot_repository.dart';

class SendMessageUseCase {
  final ChatbotRepository repository;

  SendMessageUseCase({required this.repository});

  Future<Either<Failure, ChatbotEntity>> call(String message, String lang) async {
    return await repository.sendMessage(message, lang);
  }
}

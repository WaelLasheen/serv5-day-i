import 'package:day_i/features/chatbot/domain/entity/chatbot_entity.dart';

class ChatbotModel extends ChatbotEntity {
  ChatbotModel({
    required super.reply,
    required super.suggestedServices,
  });

  factory ChatbotModel.fromJson(Map<String, dynamic> json) {
    return ChatbotModel(
      reply: json['reply'] ?? '',
      suggestedServices: json['suggested_services'] ?? [],
    );
  }
}

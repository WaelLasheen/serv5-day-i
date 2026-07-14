import 'package:day_i/features/chatbot/presentation/controller/chatbot_cubit/chat_message.dart';
import 'package:equatable/equatable.dart';

abstract class ChatbotState extends Equatable {
  const ChatbotState();

  @override
  List<Object> get props => [];
}

class ChatbotInitial extends ChatbotState {}

class ChatbotLoading extends ChatbotState {
  final List<ChatMessage> messages;
  const ChatbotLoading(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatbotSuccess extends ChatbotState {
  final List<ChatMessage> messages;
  const ChatbotSuccess(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatbotFailure extends ChatbotState {
  final List<ChatMessage> messages;
  final String error;
  const ChatbotFailure(this.messages, this.error);

  @override
  List<Object> get props => [messages, error];
}

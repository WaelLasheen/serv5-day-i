import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/chatbot/domain/use_case/send_message_use_case.dart';
import 'package:day_i/features/chatbot/presentation/controller/chatbot_cubit/chatbot_state.dart';
import 'package:day_i/features/chatbot/presentation/controller/chatbot_cubit/chat_message.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  final SendMessageUseCase _sendMessageUseCase;
  List<ChatMessage> _messages = [];

  ChatbotCubit({required SendMessageUseCase sendMessageUseCase})
      : _sendMessageUseCase = sendMessageUseCase,
        super(ChatbotInitial());

  void initChat(String welcomeMessage, List<String> initialOptions) {
    _messages = [
      ChatMessage(
        text: welcomeMessage,
        isUser: false,
        suggestedServices: initialOptions,
      ),
    ];
    emit(ChatbotSuccess(List.from(_messages)));
  }

  Future<void> sendMessage(String text, String lang) async {
    if (text.trim().isEmpty) return;

    // Clear suggestions from the previous bot message so they disappear
    if (_messages.isNotEmpty && !_messages.last.isUser) {
      final lastMsg = _messages.last;
      _messages[_messages.length - 1] = ChatMessage(
        text: lastMsg.text,
        isUser: lastMsg.isUser,
        suggestedServices: const [],
      );
    }

    // Add user message
    _messages.add(ChatMessage(text: text, isUser: true));
    emit(ChatbotLoading(List.from(_messages)));

    final result = await _sendMessageUseCase(text, lang);

    if (isClosed) return;
    result.fold(
      (failure) {
        emit(ChatbotFailure(List.from(_messages), failure.message));
        // You might optionally add an error message to the chat list here
      },
      (entity) {
        _messages.add(
          ChatMessage(
            text: entity.reply,
            isUser: false,
            suggestedServices: entity.suggestedServices,
          ),
        );
        emit(ChatbotSuccess(List.from(_messages)));
      },
    );
  }
}

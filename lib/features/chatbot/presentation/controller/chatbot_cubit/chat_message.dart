class ChatMessage {
  final String text;
  final bool isUser;
  final List<dynamic> suggestedServices;

  ChatMessage({
    required this.text,
    required this.isUser,
    this.suggestedServices = const [],
  });
}

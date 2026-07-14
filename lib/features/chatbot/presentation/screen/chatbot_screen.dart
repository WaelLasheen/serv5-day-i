import 'package:day_i/core/di/di.dart';
import 'package:day_i/features/chatbot/presentation/controller/chatbot_cubit/chatbot_cubit.dart';
import 'package:day_i/features/chatbot/presentation/controller/chatbot_cubit/chatbot_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/features/chatbot/presentation/widget/chatbot_header.dart';
import 'package:day_i/features/chatbot/presentation/widget/bot_message_bubble.dart';
import 'package:day_i/features/chatbot/presentation/widget/user_message_bubble.dart';
import 'package:day_i/features/chatbot/presentation/widget/chat_input_field.dart';
import 'package:day_i/features/chatbot/presentation/widget/service_suggestion_chip.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:intl/intl.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatbotCubit>(),
      child: const _ChatbotScreenContent(),
    );
  }
}

class _ChatbotScreenContent extends StatefulWidget {
  const _ChatbotScreenContent();

  @override
  State<_ChatbotScreenContent> createState() => _ChatbotScreenContentState();
}

class _ChatbotScreenContentState extends State<_ChatbotScreenContent> {
  final ScrollController _scrollController = ScrollController();
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _isInitialized = true;
      context.read<ChatbotCubit>().initChat(
        S.of(context).chatbotWelcomeMsg,
        [S.of(context).chatbotOptionCampaign, S.of(context).chatbotOptionService],
      );
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: const ChatbotHeader(),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatbotCubit, ChatbotState>(
              listener: (context, state) {
                _scrollToBottom();
                if (state is ChatbotFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                final messages = (state is ChatbotLoading)
                    ? state.messages
                    : (state is ChatbotSuccess)
                        ? state.messages
                        : (state is ChatbotFailure)
                            ? state.messages
                            : [];

                return ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  itemCount: messages.length + 1, // +1 for date header or loading
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Text(
                            DateFormat('EEE h:mm a').format(DateTime.now()),
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 13.sp,
                              color: theme.grey600,
                            ),
                          ),
                        ),
                      );
                    }

                    final msg = messages[index - 1];

                    if (msg.isUser) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: UserMessageBubble(text: msg.text),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 24.h),
                        child: BotMessageBubble(
                          text: msg.text,
                          content: msg.suggestedServices.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: msg.suggestedServices
                                      .map<Widget>((e) {
                                        final text = (e is Map) ? e['name']?.toString() ?? e.toString() : e.toString();
                                        return ServiceSuggestionChip(text: text);
                                      })
                                      .toList(),
                                )
                              : null,
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          BlocBuilder<ChatbotCubit, ChatbotState>(
            builder: (context, state) {
              if (state is ChatbotLoading) {
                return Padding(
                  padding: EdgeInsets.all(8.r),
                  child: const CircularProgressIndicator(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          ChatInputField(
            onSend: (text) {
              final lang = Localizations.localeOf(context).languageCode;
              context.read<ChatbotCubit>().sendMessage(text, lang);
            },
          ),
        ],
      ),
    );
  }
}

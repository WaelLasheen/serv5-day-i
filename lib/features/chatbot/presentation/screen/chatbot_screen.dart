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
import 'package:day_i/core/utils/extensions/snack_bar_extension.dart';
import 'package:intl/intl.dart' hide TextDirection;

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatbotCubit>(),
      child: const _ChatbotScreenBody(),
    );
  }
}

class _ChatbotScreenBody extends StatefulWidget {
  const _ChatbotScreenBody();

  @override
  State<_ChatbotScreenBody> createState() => _ChatbotScreenBodyState();
}

class _ChatbotScreenBodyState extends State<_ChatbotScreenBody> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
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

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
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
                  context.showErrorSnackBar(
                    message: state.error,
                    avoidBotButton: false,
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

                final isLoading = state is ChatbotLoading;

                return ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  itemCount: messages.length + 1 + (isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
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

                    if (isLoading && index == messages.length + 1) {
                      return const _BotTypingBubble();
                    }

                    final msg = messages[index - 1];

                    if (msg.isUser) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: UserMessageBubble(text: msg.text),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: BotMessageBubble(
                          text: msg.text,
                          content: msg.suggestedServices.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: msg.suggestedServices
                                      .map<Widget>((e) {
                                        final text = (e is Map)
                                            ? e['name']?.toString() ?? e.toString()
                                            : e.toString();
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

class _BotTypingBubble extends StatelessWidget {
  const _BotTypingBubble();

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36.r,
            height: 36.r,
            decoration: const BoxDecoration(
              color: Color(0xFFEDEDFC),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.smart_toy_outlined,
                color: theme.primaryColor,
                size: 20.r,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: theme.grey200,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.zero,
                topEnd: Radius.circular(24.r),
                bottomStart: Radius.circular(24.r),
                bottomEnd: Radius.circular(24.r),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 18.r,
                  height: 18.r,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.2,
                    color: theme.primaryColor,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  isRtl ? 'جاري التحضير...' : 'Typing...',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 14.sp,
                    color: theme.grey600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/features/chatbot/presentation/widget/chatbot_header.dart';
import 'package:day_i/features/chatbot/presentation/widget/bot_message_bubble.dart';
import 'package:day_i/features/chatbot/presentation/widget/user_message_bubble.dart';
import 'package:day_i/features/chatbot/presentation/widget/service_suggestion_chip.dart';
import 'package:day_i/features/chatbot/presentation/widget/chat_input_field.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: const ChatbotHeader(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              children: [
                Center(
                  child: Text(
                    "Wed 8:21 AM",
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 13.sp,
                      color: theme.grey600,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                BotMessageBubble(
                  text: S.of(context).chatbotWelcomeMsg,
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ServiceSuggestionChip(text: S.of(context).chatbotOptionCampaign),
                      ServiceSuggestionChip(text: S.of(context).chatbotOptionService),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                UserMessageBubble(
                  text: S.of(context).chatbotShowOtherOptions,
                ),
                SizedBox(height: 24.h),
                BotMessageBubble(
                  text: S.of(context).chatbotSuggesting,
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ServiceSuggestionRow(text: S.of(context).chatbotService1),
                      ServiceSuggestionRow(text: S.of(context).chatbotService2),
                      ServiceSuggestionRow(text: S.of(context).chatbotService3),
                      SizedBox(height: 12.h),
                      Text(
                        S.of(context).chatbotWhichService,
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}

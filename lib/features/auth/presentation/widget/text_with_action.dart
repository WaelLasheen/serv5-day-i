import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';

class TextWithAction extends StatelessWidget {
  final String normalText;
  final String actionText;
  final VoidCallback onActionPressed;

  const TextWithAction({
    super.key,
    required this.normalText,
    required this.actionText,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(normalText, style: FontStyles.bodySmall),
        TextButton(
          onPressed: onActionPressed,
          child: Text(
            actionText,
            style: FontStyles.bodySmall.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

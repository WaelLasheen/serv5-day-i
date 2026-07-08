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
    final textTheme = context.textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(normalText, style: textTheme.bodyMedium),
        TextButton(
          onPressed: onActionPressed,
          child: Text(
            actionText,
            style: textTheme.bodySmall?.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

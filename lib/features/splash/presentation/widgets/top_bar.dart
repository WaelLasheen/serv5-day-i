import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/widgets/language_switcher_widget.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final VoidCallback onSkip;
  const TopBar({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Skip button.
          TextButton(
            onPressed: onSkip,
            style: TextButton.styleFrom(foregroundColor: appTheme.primaryColor),
            child: Text(
              S.current.skip,
              style: context.textTheme.titleMedium?.copyWith(
                color: appTheme.primaryColor,
              ),
            ),
          ),
          LanguageSwitcher(color: appTheme.grey800),
        ],
      ),
    );
  }
}

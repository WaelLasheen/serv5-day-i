import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditions extends StatelessWidget {
  final ValueNotifier<bool> isTermsAcceptedNotifier;
  const TermsAndConditions({super.key, required this.isTermsAcceptedNotifier});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final textTheme = context.textTheme;

    return Row(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: isTermsAcceptedNotifier,
          builder: (context, isAccepted, child) {
            return Checkbox(
              value: isAccepted,
              onChanged: (newValue) {
                if (newValue != null) {
                  isTermsAcceptedNotifier.value = newValue;
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              activeColor: theme.primaryColor,
            );
          },
        ),
        Expanded(
          child: Text(
            S.current.termsAndConditions,
            style: textTheme.bodySmall?.copyWith(color: theme.primaryColor),
          ),
        ),
      ],
    );
  }
}

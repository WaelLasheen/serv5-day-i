import 'package:day_i/core/theme/font_styles.dart';
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

    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: isTermsAcceptedNotifier,
          builder: (context, value, child) {
            return Checkbox(
              value: isTermsAcceptedNotifier.value,
              onChanged: (value) => isTermsAcceptedNotifier.value = !value!,
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
            style: FontStyles.label.copyWith(color: theme.primaryColor),
          ),
        ),
      ],
    );
  }
}

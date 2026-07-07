import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final textTheme = context.textTheme;
    return Row(
      children: [
        Expanded(child: Divider(color: theme.textSecondary.withAlpha(50))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(S.current.or, style: textTheme.titleLarge?.copyWith(color: theme.grey500)),
        ),
        Expanded(child: Divider(color: theme.textSecondary.withAlpha(50))),
      ],
    );
  }
}

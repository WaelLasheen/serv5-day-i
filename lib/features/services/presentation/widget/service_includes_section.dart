import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceIncludesSection extends StatelessWidget {
  final List<String> items;

  const ServiceIncludesSection({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();
    final l10n = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.whatServiceIncludes,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: theme?.textPrimary ?? const Color(0xFF121212),
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(height: 16.h),
        ...items.map((item) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme?.grey500 ?? const Color(0xFFDEDEDE),
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: theme?.primaryColor ?? const Color(0xFF4F46E5),
                      size: 24.w,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: theme?.textSecondary ?? const Color(0xFF636262),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

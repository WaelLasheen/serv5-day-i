import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceBottomBar extends StatelessWidget {
  final String price;
  final VoidCallback onRequestService;

  const ServiceBottomBar({
    super.key,
    required this.price,
    required this.onRequestService,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();
    final l10n = S.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFDFD), // Very light gray/white
        border: Border(
          top: BorderSide(
            color: theme?.grey500 ?? const Color(0xFFCACACA),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Total Approximate
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.approximateTotal,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: theme?.textSecondary ?? const Color(0xFF636262),
                    ),
              ),
              SizedBox(height: 4.h),
              Text(
                price,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: theme?.primaryColor ?? const Color(0xFF4F46E5),
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
          // Request Service Button
          AppButton(
            text: l10n.requestService,
            onPressed: onRequestService,
            width: 139.w,
            height: 48.h,
          ),
        ],
      ),
    );
  }
}

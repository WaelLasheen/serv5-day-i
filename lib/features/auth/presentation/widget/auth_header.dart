import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/widgets/language_switcher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => context.navigateBack(),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                LanguageSwitcher(),
              ],
            ),
          ),
          Text(
            title,
            style:
                titleStyle ??
                textTheme.displayMedium?.copyWith(color: Colors.white),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style:
                subtitleStyle ??
                textTheme.headlineSmall?.copyWith(
                  color: Colors.white.withAlpha(200),
                ),
          ),
          SizedBox(height: 20.h),
          SvgPicture.asset(imagePath, height: 180.h),
        ],
      ),
    );
  }
}

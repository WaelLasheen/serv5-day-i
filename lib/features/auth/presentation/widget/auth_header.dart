import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => context.navigateBack(),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ],
          ),
          Text(
            title,
            style: titleStyle ?? FontStyles.h1.copyWith(color: Colors.white),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style:
                subtitleStyle ??
                FontStyles.bodyMedium.copyWith(
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

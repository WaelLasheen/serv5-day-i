import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarkevaWelcomeSection extends StatelessWidget {
  const MarkevaWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            spacing: 16.h,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                getIt<ImagePath>().logo,
                width: 85.r,
                height: 85.r,
                fit: BoxFit.contain,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    S.current.welcomeTo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: 24.h / 16.sp, // 150% line-height matching Figma
                      color: const Color(0xFF121212),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SvgPicture.asset(
                    getIt<ImagePath>().markeva,
                    width: 80.w,
                    height: 36.92.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            S.current.markevaDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 21.h / 14.sp,
              color: const Color(0xFF636262),
            ),
          ),
        ],
      ),
    );
  }
}

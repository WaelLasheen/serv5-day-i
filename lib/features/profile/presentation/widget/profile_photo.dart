import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePhoto extends StatelessWidget {
  final String? userPhoto;
  const ProfilePhoto({super.key, this.userPhoto});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return SizedBox(
      width: 121.29.w,
      height: 123.15.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Double Border / Ellipses
          Center(
            child: Container(
              width: 120.r,
              height: 120.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: appTheme.surfaceColor, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: userPhoto != null
                    ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(userPhoto!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.person,
                        size: 60.r,
                        color: appTheme.surfaceColor,
                      ),
              ),
            ),
          ),
          // Camera Action Button (Frame 2147238259)
          Positioned(
            right: 0,
            bottom: 10,
            child: Container(
              width: 35.r,
              height: 35.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: appTheme.surfaceColor,
                shape: BoxShape.circle,
                border: Border.all(color: appTheme.surfaceColor, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.camera_alt,
                size: 18.sp,
                color: appTheme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

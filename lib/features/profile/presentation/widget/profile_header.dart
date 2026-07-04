import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/size_extension.dart';
import 'package:day_i/features/profile/presentation/widget/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String? userPhoto;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.userEmail,
    this.userPhoto,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Container(
      width: context.width,
      height: 277.15.h,
      decoration: BoxDecoration(
        color: appTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfilePhoto(),

          const SizedBox(height: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Text(
                userName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 18,
                  fontWeight: FontWeight.w500, 
                  color: Colors.white,
                  height: 27 / 18, 
                ),
              ),
              SizedBox(height: 8), 
              Text(
                userEmail,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 14,
                  fontWeight: FontWeight.w400, 
                  color: Color(0xFFF0F0F0), 
                  height: 21 / 14, 
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

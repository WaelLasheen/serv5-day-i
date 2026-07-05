import 'package:day_i/core/utils/extensions/dialog_extensions.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/features/profile/presentation/widget/app_prefer_section.dart';
import 'package:day_i/features/profile/presentation/widget/billing_section.dart';
import 'package:day_i/features/profile/presentation/widget/business_metadata_section.dart';
import 'package:day_i/features/profile/presentation/widget/communication_info_section.dart';
import 'package:day_i/features/profile/presentation/widget/help_section.dart';
import 'package:day_i/features/profile/presentation/widget/logout_bottom_sheet.dart';
import 'package:day_i/features/profile/presentation/widget/logout_button.dart';
import 'package:day_i/features/profile/presentation/widget/plan_section.dart';
import 'package:day_i/features/profile/presentation/widget/privacy_security_section.dart';
import 'package:day_i/features/profile/presentation/widget/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(userName: 'userName', userEmail: 'userEmail'),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 120.h),
              child: Column(
                spacing: 24.h,
                children: [
                  PlanSection(),
                  CommunicationInfoSection(),
                  BusinessMetadataSection(),
                  BillingSection(),
                  PrivacySecuritySection(),
                  AppPreferSection(),
                  BillingSection(),
                  HelpSection(),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: LogoutButton(
                      onLogout: () => context.showBottomSheet(
                        LogoutBottomSheet(
                          onConfirmLogout: () => context.navigateBack(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

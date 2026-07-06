import 'package:day_i/features/profile/presentation/widget/custom_info_section.dart';
import 'package:day_i/features/profile/presentation/widget/left_navigation_chevron.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:flutter/material.dart';

class PrivacySecuritySection extends StatelessWidget {
  const PrivacySecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInfoSection(
      sectionTitle: 'الأمان والخصوصية',
      infoData: [
        InfoModel(
          title: 'تغيير كلمة المرور',
          icon: Icons.lock_outline_rounded,
          trailing: const LeftNavigationChevron(),
          onTap: () {
            Navigator.pushNamed(context, RouterPath.editProfileChangePassword);
          },
        ),
        InfoModel(
          title: 'إعدادات الخصوصية',
          icon: Icons.verified_user_outlined,
          trailing: const LeftNavigationChevron(),
          onTap: () {
            Navigator.pushNamed(context, RouterPath.privacy);
          },
        ),
      ],
    );
  }
}

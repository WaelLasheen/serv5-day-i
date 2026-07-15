import 'package:day_i/generated/l10n.dart';
import 'package:day_i/features/profile/presentation/widget/custom_info_section.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:flutter/material.dart';

class PrivacySecuritySection extends StatelessWidget {
  const PrivacySecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInfoSection(
      sectionTitle: S.of(context).securityAndPrivacy,
      infoData: [
        InfoModel(
          title: S.of(context).changePassword,
          icon: Icons.lock_outline_rounded,
          onTap: () {
            Navigator.pushNamed(context, RouterPath.editProfileChangePassword);
          },
        ),
        InfoModel(
          title: S.of(context).privacySettings,
          icon: Icons.verified_user_outlined,
          onTap: () {
            Navigator.pushNamed(context, RouterPath.privacy);
          },
        ),
      ],
    );
  }
}

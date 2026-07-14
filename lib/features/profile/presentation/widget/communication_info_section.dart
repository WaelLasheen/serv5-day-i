import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/profile/presentation/widget/custom_info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunicationInfoSection extends StatelessWidget {
  const CommunicationInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    return CustomInfoSection(
      sectionTitle: S.of(context).communicationInfo,
      // Action Widget configured exactly as your Edit button parameters
      actionWidget: Container(
        width: 35.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: appTheme.primaryColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.r),
        ),
        child: Center(
          child: IconButton(
            icon: const Icon(
              Icons.edit_outlined, // edit-02 vector placeholder
              color: Colors.white,
              size: 18,
            ),
            onPressed: () {
              Navigator.pushNamed(context, RouterPath.editProfileContacts);
            },
          ),
        ),
      ),
      infoData: [
        // Row 1: Phone
        InfoModel(
          title: S.of(context).phoneNumber,
          description: '0123456789',
          icon: Icons.phone_in_talk_outlined,
        ),
        // Row 2: Email
        InfoModel(
          title: S.of(context).email,
          description: 'info@gmail.com',
          icon: Icons.mail_outline_rounded,
        ),
        // Row 3: Name
        InfoModel(
          title: S.of(context).name,
          description: 'Fouad Bakr',
          icon: Icons.person_outline_rounded,
        ),
      ],
    );
  }
}

import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/profile/presentation/widget/custom_info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPreferSection extends StatelessWidget {
  const AppPreferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInfoSection(
      sectionTitle: 'تفضيلات التطبيق',
      infoData: [
        // Row: Notifications
        InfoModel(
          title: 'الإشعارات',
          icon: Icons.notifications_none_outlined,
          trailing: _switch(context),
        ),
        // Row: Dark Mode Option
        InfoModel(
          title: 'المظهر الداكن',
          icon: Icons.dark_mode_outlined,
          trailing: _switch(context),
        ),
        // Row: Language Metadata Selection
        InfoModel(
          title: 'اللغة',
          description: 'العربية',
          icon: Icons.language_rounded,
          trailing: _switch(context),
        ),
      ],
    );
  }

  Widget _switch(BuildContext context) {
    final appTheme = context.appTheme;
    return SizedBox(
      width: 44.w,
      height: 24.h,
      child: Switch(
        value: true,
        activeColor: appTheme.surfaceColor,
        activeTrackColor: appTheme.primaryColor,
        inactiveThumbColor: appTheme.surfaceColor,
        inactiveTrackColor: appTheme.grey500,
        onChanged: (val) {},
      ),
    );
  }
}

import 'package:day_i/features/profile/presentation/widget/custom_info_section.dart';
import 'package:flutter/material.dart';
import 'package:day_i/core/widgets/custom_switch.dart';

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
          trailing: CustomSwitch(value: true, onChanged: (val) {}),
        ),
        // Row: Dark Mode Option
        InfoModel(
          title: 'المظهر الداكن',
          icon: Icons.dark_mode_outlined,
          trailing: CustomSwitch(value: true, onChanged: (val) {}),
        ),
        // Row: Language Metadata Selection
        InfoModel(
          title: 'اللغة',
          description: 'العربية',
          icon: Icons.language_rounded,
          trailing: CustomSwitch(value: true, onChanged: (val) {}),
        ),
      ],
    );
  }
}

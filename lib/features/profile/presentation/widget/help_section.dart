import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/features/profile/presentation/widget/custom_info_section.dart';
import 'package:day_i/features/profile/presentation/widget/left_navigation_chevron.dart';
import 'package:flutter/material.dart';

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInfoSection(
      infoData: [
        InfoModel(
          title: 'مركز المساعدة',
          icon: Icons.help_outline_rounded,
          trailing: const LeftNavigationChevron(),
          onTap: () => context.navigateTo(RouterPath.contacts, arguments: 1),
        ),
        InfoModel(
          title: 'اتصل بنا',
          icon: Icons.chat_bubble_outline_rounded,
          trailing: const LeftNavigationChevron(),
          onTap: () => context.navigateTo(RouterPath.contacts),
        ),
      ],
    );
  }
}

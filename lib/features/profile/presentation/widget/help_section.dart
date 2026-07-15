import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/features/profile/presentation/widget/custom_info_section.dart';
import 'package:flutter/material.dart';

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInfoSection(
      infoData: [
        InfoModel(
          title: S.of(context).helpCenter,
          icon: Icons.help_outline_rounded,
          onTap: () => context.navigateTo(RouterPath.contacts, arguments: 1),
        ),
        InfoModel(
          title: S.of(context).contactUs,
          icon: Icons.chat_bubble_outline_rounded,
          onTap: () => context.navigateTo(RouterPath.contacts),
        ),
      ],
    );
  }
}

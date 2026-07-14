import 'package:day_i/generated/l10n.dart';
import 'package:day_i/features/profile/presentation/widget/custom_info_section.dart';
import 'package:flutter/material.dart';

class BusinessMetadataSection extends StatelessWidget {
  const BusinessMetadataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInfoSection(
      sectionTitle: S.of(context).businessInfo,
      infoData: [
        InfoModel(
          title: S.of(context).businessType,
          // description is dynamic data from the backend — placeholder until API is connected
          description: 'E-commerce',
          icon: Icons.storefront_outlined,
        ),
        InfoModel(
          title: S.of(context).location,
          // description is dynamic data from the backend — placeholder until API is connected
          description: 'Riyadh - Saudi Arabia',
          icon: Icons.location_on_outlined,
        ),
      ],
    );
  }
}

import 'package:day_i/features/profile/presentation/widget/custom_info_section.dart';
import 'package:flutter/material.dart';

class BusinessMetadataSection extends StatelessWidget {
  const BusinessMetadataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInfoSection(
      sectionTitle: 'معلومات النشاط التجاري',
      infoData: [
        InfoModel(
          title: 'نوع النشاط',
          description: 'تجارة إلكترونية',
          icon: Icons.storefront_outlined,
        ),
        InfoModel(
          title: 'الموقع',
          description: 'الرياض- المملكة العربية السعودية',
          icon: Icons.location_on_outlined,
        ),
      ],
    );
  }
}

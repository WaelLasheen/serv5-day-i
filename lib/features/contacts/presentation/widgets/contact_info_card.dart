import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/features/contacts/data/models/contact_info_model.dart';

class ContactInfoCard extends StatelessWidget {
  final ContactInfoModel? contactInfo;
  final bool isLoading;

  const ContactInfoCard({super.key, this.contactInfo, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            S.current.markivaContactInfo,
            style: FontStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
              color: const Color(0xFF636262),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFE9E9E9)),
          ),
          child: isLoading 
              ? const Padding(padding: EdgeInsets.all(20), child: Center(child: CircularProgressIndicator()))
              : Column(
            children: [
              _buildContactRow(
                context,
                title: S.current.phoneNumber,
                value: contactInfo?.phone ?? '0123456789',
                icon: Icons.phone_outlined,
              ),
              const Divider(color: Color(0xFFE9E9E9), height: 1),
              _buildContactRow(
                context,
                title: S.current.email,
                value: contactInfo?.email ?? 'info@gmail.com',
                icon: Icons.email_outlined,
              ),
              const Divider(color: Color(0xFFE9E9E9), height: 1),
              _buildContactRow(
                context,
                title: S.current.address,
                value: contactInfo?.address ?? 'السعودية-الرياض',
                icon: Icons.location_on_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactRow(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30.w,
                height: 30.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFE5E5E5),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: const Color(0xFF4F46E5), size: 16),
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: FontStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: const Color(0xFF121212),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                value,
                style: FontStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF121212),
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(width: 4.w),
              SizedBox(
                width: 40.w,
                height: 40.w,
                child: IconButton(
                  icon: const Icon(
                    Icons.copy,
                    color: Color(0xFF4F46E5),
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

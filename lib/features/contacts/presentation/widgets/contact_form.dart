import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/app_text_form_field.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          label: S.current.email,
          hintText: 'info@marketingagency.com',
          suffixIcon: const Icon(
            Icons.email_outlined,
            color: Color(0xFF9E9E9E),
          ),
          labelStyle: FontStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xFF121212),
          ),
        ),
        SizedBox(height: 16.h),
        AppTextFormField(
          label: S.current.subject,
          hintText: S.current.chooseSubject,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF9E9E9E),
          ),
          labelStyle: FontStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xFF121212),
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          S.current.userMessage,
          style: FontStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xFF121212),
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: S.current.writeMessageHere,
            hintStyle: FontStyles.bodyMedium.copyWith(
              color: const Color(0xFF9E9E9E),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Color(0xFFE9E9E9)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(color: Color(0xFF4F46E5)),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        AppButton(
          text: S.current.sendMessage,
          onPressed: () {},
          height: 48,
          backgroundColor: const Color(0xFF4F46E5),
          borderRadius: 8,
        ),
      ],
    );
  }
}

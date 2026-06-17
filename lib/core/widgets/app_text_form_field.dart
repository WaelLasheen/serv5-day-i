import 'package:day_i/core/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final String label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextStyle? labelStyle;

  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.label,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(label, style: labelStyle ?? FontStyles.bodyMedium),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          style: FontStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}

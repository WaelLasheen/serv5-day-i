import 'package:day_i/core/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppPasswordFormField extends StatefulWidget {
  final String hintText;
  final String label;
  final TextStyle? labelStyle;

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const AppPasswordFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    required this.label,
    this.labelStyle,
  });

  @override
  State<AppPasswordFormField> createState() => _AppPasswordFormFieldState();
}

class _AppPasswordFormFieldState extends State<AppPasswordFormField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(widget.label, style: widget.labelStyle ?? FontStyles.bodyMedium),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: isObscureText,
          style: FontStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon: FaIcon(
                isObscureText
                    ? FontAwesomeIcons.eyeSlash
                    : FontAwesomeIcons.eye,
                size: 20,
              ),
            ),
            prefixIcon: const Icon(Icons.lock_outline, size: 24),
          ),
        ),
      ],
    );
  }
}

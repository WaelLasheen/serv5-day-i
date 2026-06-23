import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFormField extends StatefulWidget {
  final String? hintText;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;

  const CustomFormField({
    super.key,
    this.hintText,
    this.label,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.labelStyle,
    this.style,
    this.hintStyle,
    this.onChanged,
    this.isPassword = false,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.contentPadding,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // Initialize obscure text rule based on whether it's a password field
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final globalInputTheme = context.globalTheme.inputDecorationTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: widget.labelStyle ?? FontStyles.bodyMedium,
          ),

        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          style: widget.style ?? FontStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ?? globalInputTheme.hintStyle,
            contentPadding:
                widget.contentPadding ?? globalInputTheme.contentPadding,
            border: widget.border ?? globalInputTheme.border,
            enabledBorder:
                widget.enabledBorder ?? globalInputTheme.enabledBorder,
            focusedBorder:
                widget.focusedBorder ?? globalInputTheme.focusedBorder,
            prefixIcon: widget.isPassword
                ? const Icon(Icons.lock_outline, size: 24)
                : widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: FaIcon(
                      _obscureText
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      size: 20.r,
                    ),
                  )
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}

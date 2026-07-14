import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  const CustomSearchWidget({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final customBorder = appTheme.outlineInputBorder.copyWith(
      borderRadius: BorderRadius.circular(24.r),
      borderSide: BorderSide(color: appTheme.grey500, width: 1.w),
    );

    final searchStyle = TextStyle(
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: appTheme.grey800,
    );

    return CustomFormField(
      controller: searchController,
      onChanged: onSearchChanged,
      hintText: S.current.searchHint,
      style: searchStyle,
      hintStyle: searchStyle,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: customBorder,
      enabledBorder: customBorder,
      focusedBorder: customBorder.copyWith(
        borderSide: BorderSide(color: appTheme.grey800, width: 1.5.w),
      ),
      prefixIcon: Padding(
        padding: const EdgeInsetsDirectional.only(end: 12, start: 8),
        child: Icon(Icons.search, color: appTheme.grey800, size: 24.r),
      ),
    );
  }
}

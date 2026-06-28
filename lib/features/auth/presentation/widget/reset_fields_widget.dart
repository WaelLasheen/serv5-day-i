import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';

class ResetFieldsWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AppTheme theme;
  final bool isTermsAccepted;
  final ValueChanged<bool?> onTermsChanged;
  final VoidCallback onSuccess;

  const ResetFieldsWidget({
    super.key,
    required this.formKey,
    required this.theme,
    required this.isTermsAccepted,
    required this.onTermsChanged,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العناوين داخل البطاقة البيضاء كما في الـ CSS
            Center(
              child: Text(
                "إعادة تعيين كلمة المرور",
                style: FontStyles.h1.copyWith(
                  color: const Color(0xFF121212),
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text(
                "أدخل كلمة مرور قوية لحماية حسابك",
                style: FontStyles.bodyMedium.copyWith(
                  color: const Color(0xFF636262),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 32.h),

            // حقل كلمة المرور
            SizedBox(height: 8.h),
            CustomFormField(
              isPassword: true,
              hintText: "نص تلميحي",
              label: 'كلمة المرور',
            ),
            SizedBox(height: 16.h),

            // حقل تأكيد كلمة المرور
            SizedBox(height: 2.h),
            CustomFormField(
              isPassword: true,
              hintText: "نص تلميحي",
              label: 'تأكيد كلمة المرور',
            ),
            SizedBox(height: 32.h),

            // الشروط والأحكام
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: isTermsAccepted,
                  onChanged: onTermsChanged,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  activeColor: theme.primaryColor,
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    "أوافق على الشروط والاحكام وسياسة الخصوصية",
                    style: FontStyles.label.copyWith(
                      color: const Color(0xFF121212),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h),

            // زر الإجراء
            AppButton(
              text: "زر إجراء",
              onPressed: () {
                if (formKey.currentState!.validate() && isTermsAccepted) {
                  onSuccess();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/dialog_extensions.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/app_password_form_field.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final imagePath = getIt<ImagePath>();

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),

            // 1. استدعاء الهيدر المنفصل
            const ResetPasswordHeader(),

            SizedBox(height: 20.h),
            SvgPicture.asset(
              imagePath.marketingConsulting,
              width: 150.w,
              height: 150.h,
            ),
            SizedBox(height: 30.h),
            _buildResetFields(context, theme),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => context.navigateBack(),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              Row(
                children: [
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 18.sp,
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.language, color: Colors.white, size: 24.sp),
                ],
              ),
            ],
          ),
          Text(
            S.current.forgotPassword,
            textAlign: TextAlign.center,
            style: FontStyles.h1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            S.current.resetPasswordInstruction,
            textAlign: TextAlign.center,
            style: FontStyles.bodyMedium.copyWith(
              color: const Color(0xFFE5E5E5),
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResetFields(BuildContext context, AppTheme theme) {
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
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العناوين داخل البطاقة البيضاء كما في الـ CSS
            Center(
              child: Text(
                S.current.forgotPassword,
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
                S.current.resetPasswordInstruction,
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
            AppPasswordFormField(hintText: "نص تلميحي", label: 'كلمة المرور'),
            SizedBox(height: 16.h),

            // حقل تأكيد كلمة المرور
            SizedBox(height: 2.h),
            AppPasswordFormField(
              hintText: "نص تلميحي",
              label: 'تأكيد كلمة المرور',
            ),
            SizedBox(height: 32.h),

            // الشروط والأحكام
            _buildTermsAndConditions(theme),
            SizedBox(height: 32.h),

            // زر الإجراء
            AppButton(
              text: S.current.resetPassword,
              onPressed: () {
                if (_formKey.currentState!.validate() && _isTermsAccepted) {
                  // هنا يتم إضافة منطق إعادة التعيين
                  _showSuccessDialog(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions(AppTheme theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: _isTermsAccepted,
          onChanged: (value) =>
              setState(() => _isTermsAccepted = value ?? false),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          activeColor: theme.primaryColor,
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            S.current.termsAndConditions,
            style: FontStyles.label.copyWith(
              color: const Color(0xFF121212),
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // لمنع إغلاق النافذة عند النقر خارجها إن أردت
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFFEDEDFC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Container(
            width: 280.w,
            height: 186.h,
            padding: EdgeInsets.all(32.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: context.appTheme.primaryColor,
                  size: 60.r,
                ),
                Text(
                  S.current.passwordChangedSuccess,
                  textAlign: TextAlign.center,
                  style: FontStyles.h3.copyWith(
                    color: context.appTheme.textPrimary,
                  ),
                ),
                // يمكنك إضافة زر "متابعة" أو "تسجيل الدخول" هنا بدلاً من الـ Icon إذا كان التصميم يحتوي على زر
              ],
            ),
          ),
        );
      },
    );
  }
}

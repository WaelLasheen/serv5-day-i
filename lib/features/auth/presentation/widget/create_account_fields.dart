import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController companyNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController industryController;
  final TextEditingController selectedPlanController;

  const CreateAccountFields({
    super.key,
    required this.formKey,
    required this.companyNameController,
    required this.emailController,
    required this.phoneController,
    required this.industryController,
    required this.selectedPlanController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormField(
              label: S.current.companyName,
              hintText: "أدخل الاسم الرسمي لشركتك كما سيظهر للعملاء",
              controller: companyNameController,
              prefixIcon: const Icon(
                Icons.business_outlined,
                color: Color(0xFF9E9E9E),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.companyNameReq;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            CustomFormField(
              label: S.current.email,
              hintText: "rania@gmail.com",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(
                Icons.mail_outline,
                color: Color(0xFF9E9E9E),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.emailReq;
                }
                if (!value.contains('@')) {
                  return S.current.invalidEmail;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            CustomFormField(
              label: S.current.phoneNumber,
              hintText: "+20 101010100",
              controller: phoneController,
              keyboardType: TextInputType.phone,
              prefixIcon: const Icon(
                Icons.phone_outlined,
                color: Color(0xFF9E9E9E),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.phoneReq;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            CustomFormField(
              label: S.current.industry,
              hintText: "اختر المجال الذي تعمل فيه شركتك",
              controller: industryController,
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF9E9E9E),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'مطلوب';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            CustomFormField(
              label: S.current.selectedPlan,
              hintText: "الخطة التي اشتركت بها لتفعيل خدمات المنصة",
              controller: selectedPlanController,
              prefixIcon: const Icon(
                Icons.credit_card_outlined,
                color: Color(0xFF9E9E9E),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'مطلوب';
                }
                return null;
              },
            ),
            SizedBox(height: 32.h),
            AppButton(
              text: S.current.actionButton,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Implement create account logic
                }
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

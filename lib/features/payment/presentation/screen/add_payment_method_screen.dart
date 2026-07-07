import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/core/widgets/custom_form_field.dart';
import 'package:day_i/core/widgets/custom_switch.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardHolderController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _postalCodeController = TextEditingController();

  bool _isDefaultCard = false;
  bool _saveForLater = true;

  @override
  void dispose() {
    _cardHolderController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      backgroundColor: appTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: appTheme.surfaceColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.current.addPaymentMethod,
          style: FontStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: appTheme.textPrimary,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: appTheme.primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomFormField(
                label: S.current.cardHolderName,
                controller: _cardHolderController,
                hintText: 'فؤاد بكر',
                suffixIcon: Icon(
                  Icons.person_outline,
                  size: 20.r,
                  color: appTheme.grey700,
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16.h),
              CustomFormField(
                label: S.current.cardNumber,
                controller: _cardNumberController,
                hintText: '0000 0000 0000 0000',
                suffixIcon: Icon(
                  Icons.credit_card_outlined,
                  size: 20.r,
                  color: appTheme.grey700,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: CustomFormField(
                      label: S.current.expiryDate,
                      controller: _expiryDateController,
                      hintText: '1/11/2026',
                      suffixIcon: Icon(
                        Icons.calendar_today_outlined,
                        size: 20.r,
                        color: appTheme.grey700,
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomFormField(
                      label: S.current.securityCode,
                      controller: _cvvController,
                      hintText: '000',
                      suffixIcon: Icon(
                        Icons.lock_outline,
                        size: 20.r,
                        color: appTheme.grey700,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomFormField(
                label: S.current.postalCode,
                controller: _postalCodeController,
                hintText: '0000',
                suffixIcon: Icon(
                  Icons.location_on_outlined,
                  size: 20.r,
                  color: appTheme.grey700,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.current.setDefaultPayment,
                    style: FontStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: appTheme.textPrimary,
                    ),
                  ),
                  CustomSwitch(
                    value: _isDefaultCard,
                    onChanged: (val) {
                      setState(() {
                        _isDefaultCard = val;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.current.savePaymentForLater,
                    style: FontStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: appTheme.textPrimary,
                    ),
                  ),
                  CustomSwitch(
                    value: _saveForLater,
                    onChanged: (val) {
                      setState(() {
                        _saveForLater = val;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 48.h),
              AppButton(
                height: 52.h,

                text: S.current.savePaymentMethod,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // TODO: Implement save logic here
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

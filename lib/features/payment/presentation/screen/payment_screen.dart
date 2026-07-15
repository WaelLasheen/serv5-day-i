import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/payment/presentation/controller/payment_cubit.dart';
import 'package:day_i/features/payment/presentation/controller/payment_state.dart';
import 'package:day_i/features/payment/presentation/widgets/credit_card_widget.dart';
import 'package:day_i/features/payment/presentation/widgets/payment_method_item.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = 'Paypal';

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
          S.current.paymentMethods,
          style: FontStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: appTheme.textPrimary,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CreditCardWidget(
              cardHolder: 'Fouad Mamdouh', // TODO: replace with user profile name from backend
              expiryDate: '12/26',
              lastFourDigits: '4242',
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.current.otherPaymentMethods,
                  style: FontStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: appTheme.textPrimary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouterPath.addPayment);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, color: appTheme.primaryColor, size: 20.r),
                      SizedBox(width: 4.w),
                      Text(
                        S.current.addCard,
                        style: FontStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: appTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                if (state is PaymentLoading) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: CircularProgressIndicator(color: appTheme.primaryColor),
                    ),
                  );
                } else if (state is PaymentMethodsLoaded && state.methods.isNotEmpty) {
                  return Column(
                    children: state.methods.map((method) {
                      return PaymentMethodItem(
                        title: method.name,
                        isSelected: _selectedMethod == method.name,
                        onTap: () {
                          setState(() {
                            _selectedMethod = method.name;
                          });
                        },
                      );
                    }).toList(),
                  );
                }
                return Column(
                  children: [
                    PaymentMethodItem(
                      title: 'Paypal',
                      isSelected: _selectedMethod == 'Paypal',
                      onTap: () {
                        setState(() {
                          _selectedMethod = 'Paypal';
                        });
                      },
                      customIcon: Text(
                        'RuPay',
                        style: FontStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF003087),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    PaymentMethodItem(
                      title: 'GooglePay',
                      isSelected: _selectedMethod == 'GooglePay',
                      onTap: () {
                        setState(() {
                          _selectedMethod = 'GooglePay';
                        });
                      },
                      customIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.g_mobiledata, color: Colors.red, size: 32.r),
                          Text(
                            'Pay',
                            style: FontStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: appTheme.grey700,
                            ),
                          )
                        ],
                      ),
                    ),
                    PaymentMethodItem(
                      title: 'Stripe',
                      isSelected: _selectedMethod == 'Stripe',
                      onTap: () {
                        setState(() {
                          _selectedMethod = 'Stripe';
                        });
                      },
                      customIcon: Text(
                        'stripe',
                        style: FontStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF6772E5),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 48.h),
              AppButton(
                height: 52,
                text: S.current.continuePayment,
                onPressed: () {
                  Navigator.pushNamed(context, RouterPath.successPayment);
                },
              ),
          ],
        ),
      ),
    );
  }
}

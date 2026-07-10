import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

import '../cubit/order_details_cubit.dart';
import '../widgets/customer_info_card.dart';
import '../widgets/order_details_bottom_bar.dart';
import '../widgets/order_details_card.dart';
import '../widgets/payment_summary_card.dart';
import '../widgets/service_details_card.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final appTheme = context.appTheme;

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: appTheme.surfaceColor,
        elevation: 1, // To match the bottom border
        shadowColor: appTheme.boarderPrimary,
        title: Text(
          l10n.orderDetailsTitle,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: appTheme.textPrimary,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 24.r,
            color: appTheme.textPrimary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          if (state is OrderDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrderDetailsError) {
            return Center(child: Text(state.message));
          } else if (state is OrderDetailsLoaded) {
            final order = state.orderDetails;
            return Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 24.h,
                    bottom: 100.h, // Space for bottom bar
                  ),
                  child: Column(
                    children: [
                      OrderDetailsCard(order: order),
                      SizedBox(height: 24.h),
                      CustomerInfoCard(order: order),
                      SizedBox(height: 24.h),
                      ServiceDetailsCard(order: order),
                      SizedBox(height: 24.h),
                      PaymentSummaryCard(order: order),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: const OrderDetailsBottomBar(),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

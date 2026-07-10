import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import '../../domain/entities/order_details_entity.dart';

class OrderDetailsCard extends StatelessWidget {
  final OrderDetailsEntity order;

  const OrderDetailsCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final appTheme = context.appTheme;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: appTheme.surfaceColor,
        border: Border.all(color: appTheme.boarderPrimary),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoColumn(context, l10n.invoiceNumberLabel, order.invoiceNumber, isTitle: true),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE7F9E9),
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: Text(
                  l10n.paidStatus, 
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 14.sp,
                    color: const Color(0xFF0B7317),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildInfoColumn(context, l10n.invoiceDateLabel, order.invoiceDate)),
              Expanded(child: _buildInfoColumn(context, l10n.paymentMethodLabel, order.paymentMethod)),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildInfoColumn(context, l10n.orderNumberLabel, order.orderNumber)),
              Expanded(child: _buildInfoColumn(context, l10n.paymentTimeLabel, order.paymentTime)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(BuildContext context, String label, String value, {bool isTitle = false}) {
    final appTheme = context.appTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 14.sp,
            color: appTheme.grey600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: isTitle ? 16.sp : 14.sp,
            fontWeight: isTitle ? FontWeight.w500 : FontWeight.w400,
            color: appTheme.textPrimary,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import '../../domain/entities/order_details_entity.dart';

class PaymentSummaryCard extends StatelessWidget {
  final OrderDetailsEntity order;

  const PaymentSummaryCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final appTheme = context.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.paymentSummaryLabel,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: appTheme.grey600,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: appTheme.surfaceColor,
            border: Border.all(color: appTheme.boarderPrimary),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              _buildRow(
                context: context,
                label: l10n.servicePriceLabel,
                value: '${order.servicePrice.toInt()} \$',
                valueColor: appTheme.grey600,
              ),
              Divider(height: 1, color: appTheme.boarderPrimary),
              _buildRow(
                context: context,
                label: l10n.taxLabel('15'),
                value: '${order.taxAmount.toInt()} \$',
                valueColor: appTheme.grey600,
              ),
              Divider(height: 1, color: appTheme.boarderPrimary),
              _buildRow(
                context: context,
                label: l10n.discountLabel(order.discountCode),
                value: '${order.discountAmount.toInt()} \$',
                valueColor: const Color(0xFF12BF26),
              ),
              Divider(height: 1, color: appTheme.boarderPrimary),
              _buildRow(
                context: context,
                label: l10n.finalTotalLabel,
                value: '${order.finalTotal.toInt()} \$',
                valueColor: appTheme.primaryColor,
                isBold: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRow({
    required BuildContext context,
    required String label,
    required String value,
    required Color valueColor,
    bool isBold = false,
  }) {
    final appTheme = context.appTheme;
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: appTheme.grey600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontWeight: isBold ? FontWeight.w500 : FontWeight.w400,
              fontSize: 14.sp,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

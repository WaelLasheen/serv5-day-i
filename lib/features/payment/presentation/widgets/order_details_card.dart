import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsCard extends StatelessWidget {
  final String orderNumber;
  final String serviceName;
  final String totalPrice;
  final String date;

  const OrderDetailsCard({
    super.key,
    required this.orderNumber,
    required this.serviceName,
    required this.totalPrice,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();
    final l10n = S.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme?.blueLight ?? const Color(0xFFEDEDFC),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          // Card Header
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Icon(
                  Icons.receipt_long_outlined,
                  color: theme?.primaryColor ?? const Color(0xFF3B35AC),
                  size: 24.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  l10n.orderDetails,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: theme?.primaryColor ?? const Color(0xFF3B35AC),
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),

          // Order Number Row
          _buildDetailRow(
            context: context,
            label: l10n.orderNumber,
            value: orderNumber,
          ),

          // Service Name Row
          _buildDetailRow(
            context: context,
            label: l10n.total,
            value: serviceName,
          ),

          // Total Row
          _buildDetailRow(
            context: context,
            label: l10n.total,
            value: totalPrice,
            valueColor: theme?.primaryColor ?? const Color(0xFF3B35AC),
            valueWeight: FontWeight.w500,
          ),

          // Date Row
          _buildDetailRow(
            context: context,
            label: l10n.total,
            value: date,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required BuildContext context,
    required String label,
    required String value,
    Color? valueColor,
    FontWeight? valueWeight,
  }) {
    final theme = Theme.of(context).extension<AppTheme>();
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme?.grey500 ?? const Color(0xFFDEDEDE),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: theme?.textSecondary ?? const Color(0xFF636262),
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: valueColor ??
                      theme?.textSecondary ??
                      const Color(0xFF636262),
                  fontWeight: valueWeight ?? FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}

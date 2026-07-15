import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/widgets/app_button.dart';
import 'package:day_i/features/order_history/data/data_sources/shared_orders_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewOrderBottomSheet extends StatelessWidget {
  final String serviceName;
  final String price;
  final String executionTime;
  final String tax;
  final String totalPrice;
  final int? serviceId;
  final String? category;

  const ReviewOrderBottomSheet({
    super.key,
    required this.serviceName,
    required this.price,
    required this.executionTime,
    required this.tax,
    required this.totalPrice,
    this.serviceId,
    this.category,
  });


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();
    final l10n = S.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle indicator
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: theme?.grey500 ?? const Color(0xFFDEDEDE),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(height: 16.h),
              
              // Title
              Text(
                l10n.reviewYourOrder,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: theme?.textPrimary ?? const Color(0xFF121212),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 8.h),
              Text(
                l10n.pleaseVerifyOrderDetails,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: theme?.textSecondary ?? const Color(0xFF636262),
                    ),
              ),
              SizedBox(height: 24.h),

              // Service Summary Box
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme?.grey500 ?? const Color(0xFFDEDEDE),
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    // Icon placeholder
                    Container(
                      width: 56.w,
                      height: 56.w,
                      decoration: BoxDecoration(
                        color: theme?.primaryColor ?? const Color(0xFF4F46E5),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(Icons.campaign, color: Colors.white, size: 28.w),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            serviceName,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      size: 16.w,
                                      color: theme?.textSecondary ??
                                          const Color(0xFF636262),
                                    ),
                                    SizedBox(width: 4.w),
                                    Flexible(
                                      child: Text(
                                        l10n.workingDays(executionTime),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: theme?.textSecondary ??
                                                  const Color(0xFF636262),
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFEE9DC), // Light orange
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  price,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: const Color(0xFFF56E14),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Notes Section
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  l10n.addNotesToOrder,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: theme?.primaryColor ?? const Color(0xFF4F46E5),
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              SizedBox(height: 12.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: l10n.notesHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: theme?.grey500 ?? const Color(0xFFDEDEDE)),
                  ),
                ),
                maxLines: 4,
              ),
              SizedBox(height: 24.h),

              // Price Breakdown
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: theme?.blueLight ?? const Color(0xFFEDEDFC),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    _buildPriceRow(context, l10n.servicePrice, price),
                    SizedBox(height: 12.h),
                    _buildPriceRow(context, l10n.tax(15), l10n.included),
                    SizedBox(height: 16.h),
                    const Divider(color: Color(0xFFC8C6F7)),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.total,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: theme?.primaryColor ?? const Color(0xFF4F46E5),
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Text(
                          totalPrice,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: theme?.primaryColor ?? const Color(0xFF4F46E5),
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Confirm Button
              AppButton(
                text: l10n.requestService,
                onPressed: () {
                  SharedOrdersStore.addNewOrder(
                    serviceName: serviceName,
                    priceString: price,
                    executionTime: executionTime,
                    serviceId: serviceId,
                    category: category,
                  );
                  Navigator.pop(context); // Close bottom sheet
                  Navigator.pushNamed(context, RouterPath.payment); // Assuming payment is checkout
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceRow(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF636262),
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF636262),
              ),
        ),
      ],
    );
  }
}

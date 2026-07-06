import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/order_history/domain/entities/order_stats_entity.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderFiltersWidget extends StatelessWidget {
  final String selectedStatus;
  final OrderStatsEntity stats;
  final ValueChanged<String> onFilterSelected;

  const OrderFiltersWidget({
    super.key,
    required this.selectedStatus,
    required this.stats,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    final filterItems = [
      _FilterItem(key: 'all', label: S.of(context).all, count: stats.all),
      _FilterItem(key: 'pending', label: S.of(context).pending, count: stats.pending),
      _FilterItem(key: 'approved', label: S.of(context).approved, count: stats.approved),
      _FilterItem(key: 'late', label: S.of(context).late, count: stats.lateOrders),
    ];

    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filterItems.length,
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final item = filterItems[index];
          final isSelected = item.key == selectedStatus;

          return GestureDetector(
            onTap: () => onFilterSelected(item.key),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: isSelected ? appTheme.primaryColor : appTheme.surfaceColor,
                border: Border.all(
                  color: isSelected ? appTheme.primaryColor : appTheme.grey500,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.label,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 14.sp,
                      fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                      color: isSelected ? appTheme.surfaceColor : appTheme.grey800,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? appTheme.surfaceColor.withValues(alpha: 0.2)
                          : appTheme.grey200,
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Text(
                      '${item.count}',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? appTheme.surfaceColor : appTheme.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FilterItem {
  final String key;
  final String label;
  final int count;

  _FilterItem({
    required this.key,
    required this.label,
    required this.count,
  });
}

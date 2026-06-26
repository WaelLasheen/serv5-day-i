import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PricingToggleBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onPlanSelected;
  final Color primaryColor;
  final List<String> tabs;

  const PricingToggleBar({
    super.key,
    required this.selectedIndex,
    required this.onPlanSelected,
    required this.primaryColor,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 56.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDFC), // background: #EDEDFC
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFF9E9E9E)),
      ),
      child: Row(
        spacing: 8.w,
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final label = entry.value;
          return PricingTabItem(
            label: label,
            isSelected: selectedIndex == index,
            primaryColor: primaryColor,
            onTap: () => onPlanSelected(index),
          );
        }).toList(),
      ),
    );
  }

}

class PricingTabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color primaryColor;
  final VoidCallback onTap;

  const PricingTabItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.primaryColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: isSelected ? primaryColor : const Color(0xFF121212),
            ),
          ),
        ),
      ),
    );
  }
}

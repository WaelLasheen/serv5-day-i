import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PricingToggleBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onPlanSelected;
  final Color primaryColor;

  const PricingToggleBar({
    super.key,
    required this.selectedIndex,
    required this.onPlanSelected,
    required this.primaryColor,
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
        children: [
          _buildTabItem(index: 0, label: "الأساسية"),
          _buildTabItem(index: 1, label: "الإحترافية"),
          _buildTabItem(index: 2, label: "المؤسسية"),
        ],
      ),
    );
  }

  Widget _buildTabItem({required int index, required String label}) {
    final bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onPlanSelected(index),
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

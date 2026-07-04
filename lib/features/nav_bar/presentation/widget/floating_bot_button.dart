import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingBotButton extends StatelessWidget {
  final VoidCallback onTap;

  const FloatingBotButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56.w,
        height: 56.h,
        padding: EdgeInsets.all(4.w),
        decoration: const BoxDecoration(
          color: Color(0xFF4F46E5),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.smart_toy_outlined,
            color: Colors.white,
            size: 32.r,
          ),
        ),
      ),
    );
  }
}

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
        width: 56.w,  // width: 56px من الفيجما
        height: 56.h, // height: 56px من الفيجما
        padding: EdgeInsets.all(4.w), // padding: 4px
        decoration: const BoxDecoration(
          color: Color(0xFF4F46E5), // colors/primary/Blue/Normal
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.smart_toy_outlined, // أيقونة الـ Robotic المخصصة
            color: Colors.white,
            size: 32.r, // width & height: 32px
          ),
        ),
      ),
    );
  }
}
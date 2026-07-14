import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingBotButton extends StatefulWidget {
  final VoidCallback onTap;

  const FloatingBotButton({super.key, required this.onTap});

  @override
  State<FloatingBotButton> createState() => _FloatingBotButtonState();
}

class _FloatingBotButtonState extends State<FloatingBotButton> {
  bool isExpanded = false;

  void _handleTap() {
    if (!isExpanded) {
      setState(() {
        isExpanded = true;
      });
      // Auto hide after 3 seconds if not tapped again
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted && isExpanded) {
          setState(() {
            isExpanded = false;
          });
        }
      });
    } else {
      widget.onTap();
      setState(() {
        isExpanded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 56.w,
        height: 56.h,
        transform: Matrix4.translationValues(
          isExpanded ? -16.w : 28.w, 
          0,
          0,
        ),
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: const Color(0xFF4F46E5),
          borderRadius: BorderRadius.circular(28.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
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

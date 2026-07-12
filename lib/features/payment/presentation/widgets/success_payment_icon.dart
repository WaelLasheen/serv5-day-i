import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessPaymentIcon extends StatelessWidget {
  const SuccessPaymentIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: const BoxDecoration(
        color: Color(0xFF10AC22),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Icons.check_rounded,
          color: Colors.white,
          size: 50.w,
        ),
      ),
    );
  }
}

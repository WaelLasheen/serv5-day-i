import 'package:day_i/features/services/domain/entity/service_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/generated/l10n.dart';

class PricingCardWidget extends StatelessWidget {
  final ServiceEntity serviceEntity;

  const PricingCardWidget({super.key, required this.serviceEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF8FF),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF6C63FF), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6C63FF).withValues(alpha: 0.12),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            serviceEntity.name,
            style: TextStyle(
              fontFamily: 'Rubik',
              color: const Color(0xFF121212),
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Text(
            serviceEntity.shortDescription,
            style: TextStyle(
              fontFamily: 'Rubik',
              color: const Color(0xFF636262),
              fontSize: 13.sp,
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Text(
            "${serviceEntity.price} / ${serviceEntity.priceLabel}",
            style: TextStyle(
              fontFamily: 'Rubik',
              color: const Color(0xFF6C63FF),
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            height: 40.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RouterPath.serviceDetails,
                  arguments: serviceEntity.id,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C63FF),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Center(
                child: Text(
                  serviceEntity.buttonText.isNotEmpty
                      ? serviceEntity.buttonText
                      : S.of(context).viewDetails,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

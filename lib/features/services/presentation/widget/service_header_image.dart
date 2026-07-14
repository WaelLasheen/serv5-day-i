import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceHeaderImage extends StatelessWidget {
  final String imageUrl;
  final String categoryName;

  const ServiceHeaderImage({
    super.key,
    required this.imageUrl,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 180.h,
          color: theme?.grey200 ?? Colors.grey[200],
          child: CustomNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 180.h,
          ),
        ),
        
        // Category Pill
        if (categoryName.isNotEmpty)
          Positioned.directional(
            textDirection: Directionality.of(context),
            top: 16.h,
            end: 16.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: theme?.primaryColor ?? const Color(0xFF3B35AC),
                borderRadius: BorderRadius.circular(999.r),
              ),
              child: Text(
                categoryName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
      ],
    );
  }
}

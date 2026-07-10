import 'package:day_i/features/home/presentation/param/suggested_services_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';

class SuggestedServicesWidget extends StatelessWidget {
  const SuggestedServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    final List<SuggestedServiceModel> services =
        SuggestedServiceModel.getMockServices();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "خدمات مقترحة لك",
                style: FontStyles.h3.copyWith(
                  color: const Color(0xFF121212),
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "عرض المزيد",
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      isRtl
                          ? Icons.arrow_forward_ios
                          : Icons.arrow_back_ios_new,
                      size: 14.r,
                      color: theme.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          SizedBox(
            height: 360.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: services.length,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                final service = services[index];
                return Container(
                  width: 300.w,
                  height: 355.h,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: const Color(0xFFC8C6F7)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 268.w,
                        height: 135.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.image,
                          color: Colors.grey.shade400,
                          size: 40.r,
                        ),
                      ),
                      SizedBox(height: 10.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          service.rating,
                          (index) => Icon(
                            Icons.star_rounded,
                            color: const Color(0xFFFDC776),
                            size: 16.r,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDEDFC),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Text(
                          service.tag,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            color: const Color(0xFF121212),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),

                      Flexible(
                        child: Text(
                          service.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            color: const Color(0xFF121212),
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        "السعر: ${service.price}",
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: const Color(0xFF121212),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "مدة التنفيذ: ${service.duration}",
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          color: const Color(0xFF636262),
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

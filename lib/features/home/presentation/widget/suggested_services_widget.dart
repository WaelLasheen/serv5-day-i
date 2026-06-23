import 'package:day_i/features/home/presentation/param/suggested_services_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
// تأكد من تعديل هذا المسار ليطابق مكان الموديل الجديد

class SuggestedServicesWidget extends StatelessWidget {
  const SuggestedServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    // جلب البيانات من الموديل مباشرة
    final List<SuggestedServiceModel> services =
        SuggestedServiceModel.getMockServices();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // الهيدر
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
                      Icons.arrow_back_ios_new,
                      size: 14.r,
                      color: theme.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // قائمة الكروت الأفقية المحمية من الـ Overflow
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // الصورة
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

                      // التقييم
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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

                      // الـ Tag
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

                      // العنوان محمي بـ Flexible وقارئ من الموديل
                      Flexible(
                        child: Text(
                          service.title,
                          textAlign: TextAlign.right,
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

                      // تفاصيل السعر والمدة في الأسفل قارئة من الموديل
                      Text(
                        "السعر: ${service.price}",
                        textAlign: TextAlign.right,
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
                        textAlign: TextAlign.right,
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

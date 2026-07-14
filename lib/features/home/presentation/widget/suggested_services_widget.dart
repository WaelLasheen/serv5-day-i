import 'package:day_i/features/services/domain/entity/service_entity.dart';
import 'package:day_i/features/services/presentation/controller/service_cubit/service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/router/router_path.dart';

class SuggestedServicesWidget extends StatelessWidget {
  const SuggestedServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

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
                S.of(context).suggestedServicesForYou,
                style: FontStyles.h3.copyWith(
                  color: const Color(0xFF121212),
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouterPath.services);
                },
                child: Row(
                  children: [
                    Text(
                      S.of(context).viewMore,
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
                          ? Icons.arrow_back_rounded
                          : Icons.arrow_forward_rounded,
                      size: 14.r,
                      color: theme.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          BlocBuilder<ServiceCubit, ServiceState>(
            builder: (context, state) {
              if (state is ServiceLoading || state is ServiceInitial) {
                return _buildShimmer();
              }

              if (state is ServiceSuccess && state.services.isNotEmpty) {
                // Pick the first service from each category as "suggested"
                final suggestedServices = state.services
                    .where((cat) => cat.services.isNotEmpty)
                    .map((cat) => cat.services.first)
                    .toList();

                if (suggestedServices.isEmpty) return _buildShimmer();

                return SizedBox(
                  height: 360.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: suggestedServices.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 16.w),
                    itemBuilder: (context, index) {
                      final service = suggestedServices[index];
                      return _ServiceCard(service: service);
                    },
                  ),
                );
              }

              return _buildShimmer();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      height: 360.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        separatorBuilder: (_, __) => SizedBox(width: 16.w),
        itemBuilder: (_, __) => Container(
          width: 300.w,
          height: 355.h,
          decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceEntity service;
  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouterPath.serviceDetails,
          arguments: service.id,
        );
      },
      child: Container(
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
                5,
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
                service.name,
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
                service.shortDescription,
                maxLines: 2,
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
              "${service.price} / ${service.priceLabel}",
              style: TextStyle(
                fontFamily: 'Rubik',
                color: theme.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

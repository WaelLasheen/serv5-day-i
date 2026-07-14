import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/features/services/domain/entity/service_details_entity.dart';
import 'package:day_i/features/services/presentation/controller/service_details_cubit/service_details_cubit.dart';
import 'package:day_i/features/services/presentation/controller/service_details_cubit/service_details_state.dart';
import 'package:day_i/features/services/presentation/widget/review_order_bottom_sheet.dart';
import 'package:day_i/features/services/presentation/widget/service_bottom_bar.dart';
import 'package:day_i/features/services/presentation/widget/service_header_image.dart';
import 'package:day_i/features/services/presentation/widget/service_includes_section.dart';
import 'package:day_i/features/services/presentation/widget/service_info_section.dart';
import 'package:day_i/features/services/presentation/widget/service_reviews_section.dart';
import 'package:day_i/features/services/presentation/widget/similar_services_section.dart';
import 'package:day_i/features/services/presentation/widget/why_choose_us_section.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final int serviceId;
  const ServiceDetailsScreen({super.key, required this.serviceId});

  void _showReviewOrderBottomSheet(
    BuildContext context,
    ServiceDetailsEntity data,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ReviewOrderBottomSheet(
          serviceName: data.sectionOne.title,
          price: '${data.sectionOne.price}\$',
          executionTime: data.sectionOne.duration,
          tax: '15', // Mock tax
          totalPrice: '${data.sectionOne.price}\$', // Should calculate tax
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>();
    final l10n = S.of(context);

    // Mock reviews since API doesn't provide them
    final reviews = [
      ReviewItem(
        authorName: l10n.mockReviewAuthor,
        dateString: l10n.mockReviewDate,
        comment: l10n.mockReviewComment,
        rating: 5,
      ),
      ReviewItem(
        authorName: l10n.mockReviewAuthor,
        dateString: l10n.mockReviewDate,
        comment: l10n.mockReviewComment,
        rating: 5,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          l10n.serviceDetailsLabel,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Directionality.of(context) == TextDirection.rtl
                ? Icons.arrow_forward_rounded
                : Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocBuilder<ServiceDetailsCubit, ServiceDetailsState>(
        builder: (context, state) {
          if (state is ServiceDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ServiceDetailsError) {
            return Center(child: Text(state.message));
          } else if (state is ServiceDetailsLoaded) {
            final data = state.serviceDetails;

            final includes = data.sectionTwo.items
                .map((e) => e.title ?? '')
                .where((e) => e.isNotEmpty)
                .toList();

            final features = data.sectionThree.cards
                .map(
                  (e) => FeatureItem(
                    icon: Icons
                        .check_circle_outline, // Fallback icon since API provides <i></i>
                    title: e.title,
                    subtitle: e.description,
                    iconColor: const Color(0xFF14B8A6),
                    backgroundColor: const Color(0xFFDCF4F2),
                  ),
                )
                .toList();

            final similarServices = data.sectionFour.services
                .map(
                  (e) => SimilarServiceItem(
                    title: e.title,
                    price: '${e.price} \$', // Assuming USD or local currency
                    rating: double.tryParse(e.rating) ?? 0.0,
                    imageUrl: e.image,
                  ),
                )
                .toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ServiceHeaderImage(
                        imageUrl: data.sectionOne.image,
                        categoryName: data.sectionOne.category,
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ServiceInfoSection(
                          title: data.sectionOne.title,
                          rating:
                              double.tryParse(data.sectionOne.rating) ?? 0.0,
                          reviewsCount: data.sectionOne.reviews,
                          executionTime: data.sectionOne.duration,
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          l10n.serviceDescription,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color:
                                    theme?.textPrimary ??
                                    const Color(0xFF121212),
                              ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          data.sectionOne.description,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color:
                                    theme?.textSecondary ??
                                    const Color(0xFF636262),
                                height: 1.5,
                              ),
                        ),
                        SizedBox(height: 24.h),
                        ServiceIncludesSection(items: includes),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                  WhyChooseUsSection(features: features),
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: ServiceReviewsSection(
                      reviews: reviews,
                      onViewAll: () {},
                    ),
                  ),
                  SizedBox(height: 32.h),
                  SimilarServicesSection(services: similarServices),
                  SizedBox(height: 48.h),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar:
          BlocBuilder<ServiceDetailsCubit, ServiceDetailsState>(
            builder: (context, state) {
              if (state is ServiceDetailsLoaded) {
                final data = state.serviceDetails;
                return ServiceBottomBar(
                  price: '${data.sectionOne.price} \$',
                  onRequestService: () =>
                      _showReviewOrderBottomSheet(context, data),
                );
              }
              return const SizedBox.shrink();
            },
          ),
    );
  }
}

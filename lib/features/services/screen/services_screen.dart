import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/features/services/widgets/pagination_widget.dart';
import 'package:day_i/features/services/widgets/service_category_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/services/presentation/service_cubit/service_cubit.dart';
import 'package:day_i/core/utils/extensions/snack_bar_extension.dart';
import 'package:day_i/features/services/presentation/widget/service_category_shimmer_widget.dart';
import 'package:day_i/core/widgets/app_button.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.current.services,
          style: FontStyles.h2.copyWith(
            color: themeColors.textPrimary,
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: themeColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: themeColors.boarderPrimary, height: 1),
        ),
      ),
      body: BlocConsumer<ServiceCubit, ServiceState>(
        listener: (context, state) {
          if (state is ServiceFailure) {
            context.showErrorSnackBar(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is ServiceLoading || state is ServiceInitial) {
            return const ServicesShimmerLoading();
          } else if (state is ServiceSuccess) {
            final services = state.services;
            if (services.isEmpty) {
              return Center(
                child: Text(
                  S.current.noServicesAvailable,
                  style: FontStyles.bodyMedium.copyWith(
                    color: themeColors.textSecondary,
                    fontSize: 14.sp,
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 24.h, bottom: 100.h),
              child: Column(
                children: [
                  ...services.map(
                    (cat) => Padding(
                      padding: EdgeInsets.only(bottom: 32.h),
                      child: ServiceCategoryWidget(mainServiceEntity: cat),
                    ),
                  ),
                  PaginationWidget(themeColors: themeColors),
                ],
              ),
            );
          } else if (state is ServiceFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.current.oopsError,
                    style: FontStyles.bodyMedium.copyWith(
                      color: themeColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AppButton(
                    text: Localizations.localeOf(context).languageCode == 'ar'
                        ? 'إعادة المحاولة'
                        : 'Retry',
                    onPressed: () {
                      context.read<ServiceCubit>().getServices(
                        Localizations.localeOf(context).languageCode,
                      );
                    },
                    width: 140.w,
                    height: 40.h,
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

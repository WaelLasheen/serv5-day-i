import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/core/theme/app_theme.dart';
import 'package:day_i/core/theme/font_styles.dart';
import 'package:day_i/features/services/presentation/widget/service_category_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/services/presentation/controller/service_cubit/service_cubit.dart';
import 'package:day_i/core/utils/extensions/snack_bar_extension.dart';
import 'package:day_i/features/services/presentation/widget/service_category_shimmer_widget.dart';
import 'package:day_i/core/widgets/app_button.dart';

class ServicesScreen extends StatefulWidget {
  /// If provided, the screen will scroll to the category with this id.
  final int? initialCategoryId;

  const ServicesScreen({super.key, this.initialCategoryId});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _categoryKeys = {};
  bool _hasScrolledToInitial = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToCategory(int categoryId) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final key = _categoryKeys[categoryId];
      if (key == null) return;
      final ctx = key.currentContext;
      if (ctx == null) {
        Future.delayed(const Duration(milliseconds: 150), () {
          if (!mounted) return;
          final retryCtx = _categoryKeys[categoryId]?.currentContext;
          if (retryCtx != null && retryCtx.mounted) {
            Scrollable.ensureVisible(
              retryCtx,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        });
        return;
      }
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

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
        automaticallyImplyLeading: false,
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
          if (state is ServiceSuccess &&
              widget.initialCategoryId != null &&
              !_hasScrolledToInitial) {
            _hasScrolledToInitial = true;
            _scrollToCategory(widget.initialCategoryId!);
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

            // Build keys for each category
            for (final cat in services) {
              _categoryKeys.putIfAbsent(cat.id, () => GlobalKey());
            }

            if (widget.initialCategoryId != null && !_hasScrolledToInitial) {
              _hasScrolledToInitial = true;
              _scrollToCategory(widget.initialCategoryId!);
            }

            return SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 24.h, bottom: 100.h),
              child: Column(
                children: [
                  ...services.map(
                    (cat) => Padding(
                      key: _categoryKeys[cat.id],
                      padding: EdgeInsets.only(bottom: 32.h),
                      child: ServiceCategoryWidget(mainServiceEntity: cat),
                    ),
                  ),
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
                        ? S.of(context).retry
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

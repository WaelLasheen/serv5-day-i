import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/size_extension.dart';
import 'package:day_i/core/widgets/custom_search_widget.dart';
import 'package:day_i/features/services/presentation/controller/service_cubit/service_cubit.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardHeader extends StatefulWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  const DashboardHeader({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
  });

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onSearchQueryChanged);
  }

  @override
  void dispose() {
    widget.searchController.removeListener(_onSearchQueryChanged);
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _onSearchQueryChanged() {
    final query = widget.searchController.text.trim();
    if (query.isEmpty) {
      _removeOverlay();
      return;
    }
    _showOrUpdateOverlay();
  }

  void _showOrUpdateOverlay() {
    if (_overlayEntry == null) {
      final serviceCubit = context.read<ServiceCubit>();
      _overlayEntry = _createOverlayEntry(serviceCubit);
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry!.markNeedsBuild();
    }
  }

  OverlayEntry _createOverlayEntry(ServiceCubit serviceCubit) {
    return OverlayEntry(
      builder: (overlayContext) {
        final currentQuery = widget.searchController.text.trim().toLowerCase();
        if (currentQuery.isEmpty) return const SizedBox.shrink();

        return Positioned(
          width: overlayContext.width - 32.w,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, 52.h),
            child: Material(
              elevation: 12,
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
              child: TapRegion(
                onTapOutside: (event) {
                  _removeOverlay();
                  FocusScope.of(context).unfocus();
                },
                child: BlocProvider<ServiceCubit>.value(
                  value: serviceCubit,
                  child: BlocBuilder<ServiceCubit, ServiceState>(
                    builder: (blocContext, state) {
                    if (state is! ServiceSuccess || state.services.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    final matchingServices = state.services
                        .expand((cat) => cat.services)
                        .where(
                          (s) =>
                              s.name.toLowerCase().contains(currentQuery) ||
                              s.shortDescription.toLowerCase().contains(
                                currentQuery,
                              ),
                        )
                        .toList();

                    if (matchingServices.isEmpty) {
                      return Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: const Color(
                              0xFF6C63FF,
                            ).withValues(alpha: 0.3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'لا توجد خدمات مطابقة لـ "$currentQuery"',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: const Color(0xFF636262),
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      );
                    }

                    return Container(
                      constraints: BoxConstraints(maxHeight: 300.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: const Color(0xFF6C63FF).withValues(alpha: 0.4),
                          width: 1.2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          shrinkWrap: true,
                          itemCount: matchingServices.length,
                          separatorBuilder: (_, __) => const Divider(
                            height: 1,
                            color: Color(0xFFEEEEEE),
                          ),
                          itemBuilder: (itemContext, index) {
                            final service = matchingServices[index];
                            return InkWell(
                              onTap: () {
                                final navigator = Navigator.of(context);
                                _removeOverlay();
                                FocusScope.of(context).unfocus();
                                navigator.pushNamed(
                                  RouterPath.serviceDetails,
                                  arguments: service.id,
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 12.h,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.r),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFAF8FF),
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.design_services_outlined,
                                        color: const Color(0xFF6C63FF),
                                        size: 20.r,
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            service.name,
                                            style: TextStyle(
                                              fontFamily: 'Rubik',
                                              color: const Color(0xFF121212),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            service.shortDescription,
                                            style: TextStyle(
                                              fontFamily: 'Rubik',
                                              color: const Color(0xFF636262),
                                              fontSize: 12.sp,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      "${service.price} / ${service.priceLabel}",
                                      style: TextStyle(
                                        fontFamily: 'Rubik',
                                        color: const Color(0xFF6C63FF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final imagePath = getIt<ImagePath>();

    return Container(
      width: context.width,
      height: 214.h,
      padding: EdgeInsets.fromLTRB(16.w, kToolbarHeight, 16.w, 0),
      decoration: BoxDecoration(
        color: appTheme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        spacing: 24.h,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            spacing: 8.w,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: appTheme.surfaceColor,
                  size: 24.r,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RouterPath.notifications);
                },
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.pushNamed(context, RouterPath.profile);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      child: Icon(
                        Icons.person,
                        color: appTheme.primaryColor,
                        size: 40.r,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      S.of(context).helloUser('Ali'),
                      style: const TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Image.asset(imagePath.logo, width: 30.r, height: 30.r),
            ],
          ),
          TapRegion(
            onTapOutside: (event) {
              if (_overlayEntry != null) {
                _removeOverlay();
                FocusScope.of(context).unfocus();
              }
            },
            child: CompositedTransformTarget(
              link: _layerLink,
              child: CustomSearchWidget(
                searchController: widget.searchController,
                onSearchChanged: widget.onSearchChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

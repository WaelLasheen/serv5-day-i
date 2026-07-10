import 'package:day_i/core/widgets/custom_search_widget.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/navigation_extension.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/features/order_history/presentation/order_history_cubit/order_history_cubit.dart';
import 'package:day_i/features/order_history/presentation/order_history_cubit/order_history_state.dart';
import 'package:day_i/features/order_history/presentation/widgets/order_card.dart';
import 'package:day_i/features/order_history/presentation/widgets/order_filters_widget.dart';
import 'package:day_i/features/order_history/presentation/widgets/order_history_shimmer.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late OrderHistoryCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<OrderHistoryCubit>();
    _cubit.fetchInitialOrders();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100.h) {
      _cubit.loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return Scaffold(
      backgroundColor: appTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          S.of(context).serviceRegister,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: appTheme.textPrimary,
          ),
        ),
        backgroundColor: appTheme.surfaceColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(color: appTheme.boarderPrimary, height: 1.h),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search field
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
              child: CustomSearchWidget(
                searchController: _searchController,
                onSearchChanged: (query) {
                  _cubit.searchOrders(query);
                },
              ),
            ),

            // State-dependent filter and orders list
            Expanded(
              child: BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
                builder: (context, state) {
                  if (state is OrderHistoryLoading) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const Column(
                        children: [
                          SizedBox(height: 8),
                          Expanded(child: OrderHistoryShimmer()),
                        ],
                      ),
                    );
                  }

                  if (state is OrderHistoryFailure) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: appTheme.errorColor,
                              size: 48.r,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              state.errorMessage,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 14.sp,
                                color: appTheme.textSecondary,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            ElevatedButton(
                              onPressed: () => _cubit.refresh(),
                              child: Text(S.of(context).oopsError),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  if (state is OrderHistorySuccess) {
                    return RefreshIndicator(
                      onRefresh: () => _cubit.refresh(),
                      color: appTheme.primaryColor,
                      backgroundColor: appTheme.surfaceColor,
                      child: Column(
                        children: [
                          // Filters
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            child: OrderFiltersWidget(
                              selectedStatus: state.params.status,
                              stats: state.stats,
                              onFilterSelected: (status) {
                                _cubit.filterByStatus(status);
                              },
                            ),
                          ),

                          // Orders List
                          Expanded(
                            child: state.orders.isEmpty
                                ? ListView(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    children: [
                                      SizedBox(height: 100.h),
                                      Center(
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.assignment_late_outlined,
                                              size: 64.r,
                                              color: appTheme.grey700,
                                            ),
                                            SizedBox(height: 16.h),
                                            Text(
                                              S.of(context).noOrders,
                                              style: TextStyle(
                                                fontFamily: 'Rubik',
                                                fontSize: 16.sp,
                                                color: appTheme.grey800,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : ListView.separated(
                                    controller: _scrollController,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    padding: EdgeInsets.fromLTRB(
                                      16.w,
                                      8.h,
                                      16.w,
                                      80.h,
                                    ),
                                    itemCount:
                                        state.orders.length +
                                        (state.isPaginationLoading ? 1 : 0),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 16.h),
                                    itemBuilder: (context, index) {
                                      if (index == state.orders.length) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 12.h,
                                          ),
                                          child: Center(
                                            child: SizedBox(
                                              width: 24.r,
                                              height: 24.r,
                                              child: CircularProgressIndicator(
                                                color: appTheme.primaryColor,
                                                strokeWidth: 2.w,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final order = state.orders[index];
                                      return OrderCard(
                                        order: order,
                                        onViewDetails: () {
                                          context.navigateTo(
                                            RouterPath.orderDetails,
                                            arguments: order.id.toString(),
                                          );
                                        },
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

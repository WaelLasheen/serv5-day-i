import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:day_i/features/home/presentation/screen/home_screen.dart';
import 'package:day_i/features/nav_bar/presentation/param/nav_bar_item_model.dart';
import 'package:day_i/features/nav_bar/presentation/widget/nav_bar_item.dart';
import 'package:day_i/features/profile/presentation/screen/profile_screen.dart';
import 'package:day_i/features/nav_bar/presentation/widget/floating_bot_button.dart';
import 'package:day_i/features/services/presentation/screen/services_screen.dart';
import 'package:day_i/features/services/presentation/controller/service_cubit/service_cubit.dart';
import 'package:day_i/features/services/domain/use_case/get_services_use_case.dart';
import 'package:day_i/core/di/di.dart';
import 'package:day_i/features/order_history/presentation/screens/order_history_screen.dart';
import 'package:day_i/features/order_history/presentation/order_history_cubit/order_history_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _currentIndex = 0;
  List<Widget>? _screens;
  Locale? _currentLocale;
  late final ServiceCubit _serviceCubit;

  @override
  void initState() {
    super.initState();
    _serviceCubit = ServiceCubit(
      getServicesUseCase: getIt<GetServicesUseCase>(),
    );
  }

  @override
  void dispose() {
    _serviceCubit.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    if (_currentLocale != locale) {
      _currentLocale = locale;
      _serviceCubit.getServices(locale.languageCode);
      _screens = [
        const HomeScreen(),
        const ServicesScreen(),
        BlocProvider(
          create: (context) => getIt<OrderHistoryCubit>(),
          child: const OrderHistoryScreen(),
        ),
        const ProfileScreen(),
      ];
    }
  }

  List<NavBarItemModel> get navBarItems => [
    NavBarItemModel(icon: Icons.home_outlined, label: S.current.home, index: 0),
    NavBarItemModel(
      icon: Icons.dashboard_customize_outlined,
      label: S.current.services,
      index: 1,
    ),
    NavBarItemModel(icon: Icons.access_time, label: S.current.orders, index: 2),
    NavBarItemModel(
      icon: Icons.person_outline,
      label: S.current.account,
      index: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    return BlocProvider.value(
      value: _serviceCubit,
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            _screens != null
                ? _screens![_currentIndex]
                : const SizedBox.shrink(),
            Positioned(
              right: 0,
              bottom:
                  94.h + 24.h, // Adjusted for padding of bottomNavigationBar
              child: FloatingBotButton(
                onTap: () {
                  Navigator.pushNamed(context, RouterPath.chatbot);
                },
              ),
            ),
          ],
        ),

        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: Container(
              width: 343.w,
              height: 76.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: appTheme.blueLight,
                borderRadius: BorderRadius.circular(999.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...navBarItems.map((e) {
                    return Expanded(
                      child: NavBarItem(
                        icon: e.icon,
                        label: e.label,
                        onTap: () {
                          if (_currentIndex != e.index) {
                            setState(() => _currentIndex = e.index);
                          }
                        },
                        isSelected: e.index == _currentIndex,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

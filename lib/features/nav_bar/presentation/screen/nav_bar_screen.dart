import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/home/presentation/screen/home_screen.dart';
import 'package:day_i/features/nav_bar/presentation/param/nav_bar_item_model.dart';
import 'package:day_i/features/nav_bar/presentation/widget/nav_bar_item.dart';
import 'package:day_i/features/profile/presentation/screen/profile_screen.dart';
import 'package:day_i/features/nav_bar/presentation/widget/floating_bot_button.dart';
import 'package:day_i/features/services/screen/services_screen.dart';
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
  final List<Widget> _screens = [
    const HomeScreen(),
    const ServicesScreen(),
    const Text('data'),
    const ProfileScreen(),
  ];

  final List<NavBarItemModel> navBarItems = [
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

    return Scaffold(
      extendBody: true,
      body: _screens[_currentIndex],

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 343.w,
                height: 76.h,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: appTheme.blueLight,
                  borderRadius: BorderRadius.circular(999.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...navBarItems.map((e) {
                      return NavBarItem(
                        icon: e.icon,
                        label: e.label,
                        onTap: () {
                          if (_currentIndex != e.index) {
                            setState(() => _currentIndex = e.index);
                          }
                        },
                        isSelected: e.index == _currentIndex,
                      );
                    }),
                  ],
                ),
              ),

              Positioned(
                right: 34.w,
                bottom: 94.h,
                child: FloatingBotButton(
                  onTap: () {
                    // الأكشن الخاص بالبوت
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

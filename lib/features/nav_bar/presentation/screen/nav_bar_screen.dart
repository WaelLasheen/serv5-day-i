import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/features/home/presentation/screen/home_screen.dart';
import 'package:day_i/features/nav_bar/presentation/param/nav_bar_item_model.dart';
import 'package:day_i/features/nav_bar/presentation/widget/nav_bar_item.dart';
import 'package:day_i/features/nav_bar/presentation/widget/floating_bot_button.dart'; // استدعاء زر البوت المنفصل
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
    const Text('data'),
    const Text('data'),
    const Text('data'),
  ];

  final List<NavBarItemModel> navBarItems = [
    NavBarItemModel(icon: Icons.home_outlined, label: S.current.home, index: 0),
    NavBarItemModel(
      icon: Icons.dashboard_customize_outlined,
      label: S.current.services,
      index: 1,
    ),
    NavBarItemModel(
      icon: Icons.access_time,
      label: S.current.orders,
      index: 2,
    ),
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
      // لمنع محتوى الشاشات من التداخل بشكل سيئ مع الـ Navbar العائم تحت
      extendBody: true, 
      body: _screens[_currentIndex],

      // جعل الـ Navbar والبوت عائمين تماماً فوق الشاشة عبر Stack سفلي مخصص
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 24.h), // المارجن السفلي العائم من الفيجما
          child: Stack(
            clipBehavior: Clip.none, // للسماح للبوت بالظهور فوق الـ Navbar بحرية دون اقتصاص
            alignment: Alignment.bottomCenter,
            children: [
              // 1. جسم الـ Navbar العائم الأساسي
              Container(
                width: 343.w,
                height: 76.h,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: appTheme.blueLight,
                  borderRadius: BorderRadius.circular(999.r), // حواف دائرية كاملة لجعلها عائمة
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4), // ظل خفيف لإبراز العوم على الشاشة
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

              // 2. استدعاء زر البوت المنفصل متموضعاً فوقها بالـ Gap المطلوب (18px)
              Positioned(
                right: 34.w, // محاذاة أفقية متناسقة مع حواف الكروت
                bottom: 94.h, // حساب المسافة: 76.h (ارتفاع النافبار) + 18.h (الجاب المطلوب) = 94.h
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
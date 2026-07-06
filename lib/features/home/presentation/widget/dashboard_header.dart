import 'package:day_i/core/di/di.dart';
import 'package:day_i/core/utils/consts/image_path.dart';
import 'package:day_i/core/utils/extensions/get_app_theme.dart';
import 'package:day_i/core/utils/extensions/size_extension.dart';
import 'package:day_i/features/home/presentation/widget/custom_search_widget.dart';
import 'package:day_i/core/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardHeader extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  const DashboardHeader({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
  });

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
                onTap: () {
                  Navigator.pushNamed(context, RouterPath.profile);
                },
                child: CircleAvatar(
                  radius: 20.r,
                  child: Icon(
                    Icons.person,
                    color: appTheme.primaryColor,
                    size: 40.r,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouterPath.profile);
                },
                child: const Text(
                  'أهلا علي !',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              Image.asset(imagePath.logo, width: 30.r, height: 30.r),
            ],
          ),
          CustomSearchWidget(
            searchController: searchController,
            onSearchChanged: onSearchChanged,
          ),
        ],
      ),
    );
  }
}

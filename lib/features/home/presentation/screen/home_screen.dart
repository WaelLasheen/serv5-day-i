import 'dart:async';

import 'package:day_i/features/home/presentation/widget/dashboard_header.dart';
import 'package:day_i/features/home/presentation/widget/suggested_services_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day_i/features/home/presentation/widget/service_categories_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  Timer? debounceTimer;

  void _handleSearchChanged(String query) {
    debounceTimer?.cancel();
    debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (kDebugMode) {
        print(query);
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DashboardHeader(
              searchController: searchController,
              onSearchChanged: _handleSearchChanged,
            ),
            SizedBox(height: 16.h),
            const ServiceCategoriesWidget(),

            SizedBox(height: 16.h),
            const SuggestedServicesWidget(),

            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final IconData icon;

  const CategoryModel({required this.title, required this.icon});

  static List<CategoryModel> getMockCategories() {
    return const [
      CategoryModel(title: 'كتابة المحتوي', icon: Icons.description),
      CategoryModel(title: 'التصميم', icon: Icons.grid_view),
      CategoryModel(title: 'إعلانات', icon: Icons.campaign),
      CategoryModel(title: 'سوشيال ميديا', icon: Icons.share),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:day_i/generated/l10n.dart';

class CategoryModel {
  final String title;
  final IconData icon;

  const CategoryModel({required this.title, required this.icon});

  static List<CategoryModel> getMockCategories() {
    return [
      CategoryModel(title: S.current.mockCategoryContentWriting, icon: Icons.description),
      CategoryModel(title: S.current.mockCategoryDesign, icon: Icons.grid_view),
      CategoryModel(title: S.current.mockCategoryAds, icon: Icons.campaign),
      CategoryModel(title: S.current.mockCategorySocialMedia, icon: Icons.share),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:day_i/features/home/domain/entity/home_category_entity.dart';

class HomeCategoryModel extends HomeCategoryEntity {
  const HomeCategoryModel({
    required super.title,
    required super.icon,
  });

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      title: json['title'] ?? json['name'] ?? '',
      icon: Icons.grid_view,
    );
  }
}

import 'package:flutter/material.dart';

class ServiceModel {
  final String title;
  final String description;
  final String price;
  final IconData icon;

  ServiceModel({
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
  });

  static List<ServiceModel> getMockServices() {
    return [
      ServiceModel(
        title: 'إدارة حسابات شهرية',
        description:
            'إدارة كاملة لحساباتك تشمل النشر، المتابعة، والرد على التعليقات.',
        price: '3000 \$ / شهر',
        icon: Icons.calendar_month,
      ),
      ServiceModel(
        title: 'حملات إعلانية ممولة',
        description:
            'إنشاء وإدارة حملات إعلانية ممولة للوصول لجمهورك المستهدف.',
        price: '1500 \$ / شهر',
        icon: Icons.campaign,
      ),
      ServiceModel(
        title: 'تصميم بوستات سوشيال',
        description: 'تصميم بوستات احترافية تناسب هويتك البصرية وتجذب العملاء.',
        price: '500 \$ / شهر',
        icon: Icons.design_services,
      ),
      ServiceModel(
        title: 'كتابة محتوى تسويقي',
        description: 'كتابة محتوى تسويقي وإبداعي يتناسب مع أهدافك.',
        price: '800 \$ / شهر',
        icon: Icons.edit_document,
      ),
    ];
  }
}

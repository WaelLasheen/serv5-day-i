import 'package:day_i/features/services/domain/entity/service_details_entity.dart';

class ServiceDetailsModel {
  final SectionOneModel sectionOne;
  final SectionTwoModel sectionTwo;
  final SectionThreeModel sectionThree;
  final SectionFourModel sectionFour;
  final OrderButtonModel orderButton;

  ServiceDetailsModel({
    required this.sectionOne,
    required this.sectionTwo,
    required this.sectionThree,
    required this.sectionFour,
    required this.orderButton,
  });

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) {
    return ServiceDetailsModel(
      sectionOne: SectionOneModel.fromJson(json['section_one'] ?? {}),
      sectionTwo: SectionTwoModel.fromJson(json['section_two'] ?? {}),
      sectionThree: SectionThreeModel.fromJson(json['section_three'] ?? {}),
      sectionFour: SectionFourModel.fromJson(json['section_four'] ?? {}),
      orderButton: OrderButtonModel.fromJson(json['order_button'] ?? {}),
    );
  }

  ServiceDetailsEntity toEntity() => ServiceDetailsEntity(
        sectionOne: sectionOne.toEntity(),
        sectionTwo: sectionTwo.toEntity(),
        sectionThree: sectionThree.toEntity(),
        sectionFour: sectionFour.toEntity(),
        orderButton: orderButton.toEntity(),
      );
}

class SectionOneModel {
  final int id;
  final String image;
  final String category;
  final String title;
  final String description;
  final String price;
  final String rating;
  final int reviews;
  final String duration;

  SectionOneModel({
    required this.id,
    required this.image,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.duration,
  });

  factory SectionOneModel.fromJson(Map<String, dynamic> json) {
    return SectionOneModel(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price']?.toString() ?? '0',
      rating: json['rating']?.toString() ?? '0.0',
      reviews: json['reviews'] ?? 0,
      duration: json['duration'] ?? '',
    );
  }

  SectionOneEntity toEntity() => SectionOneEntity(
        id: id,
        image: image,
        category: category,
        title: title,
        description: description,
        price: price,
        rating: rating,
        reviews: reviews,
        duration: duration,
      );
}

class SectionTwoModel {
  final String title;
  final List<SectionTwoItemModel> items;

  SectionTwoModel({
    required this.title,
    required this.items,
  });

  factory SectionTwoModel.fromJson(Map<String, dynamic> json) {
    return SectionTwoModel(
      title: json['title'] ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => SectionTwoItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  SectionTwoEntity toEntity() => SectionTwoEntity(
        title: title,
        items: items.map((e) => e.toEntity()).toList(),
      );
}

class SectionTwoItemModel {
  final String icon;
  final String? title;

  SectionTwoItemModel({
    required this.icon,
    this.title,
  });

  factory SectionTwoItemModel.fromJson(Map<String, dynamic> json) {
    return SectionTwoItemModel(
      icon: json['icon'] ?? '',
      title: json['title'],
    );
  }

  SectionTwoItemEntity toEntity() => SectionTwoItemEntity(
        icon: icon,
        title: title,
      );
}

class SectionThreeModel {
  final String title;
  final List<SectionThreeCardModel> cards;

  SectionThreeModel({
    required this.title,
    required this.cards,
  });

  factory SectionThreeModel.fromJson(Map<String, dynamic> json) {
    return SectionThreeModel(
      title: json['title'] ?? '',
      cards: (json['cards'] as List<dynamic>?)
              ?.map((e) => SectionThreeCardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  SectionThreeEntity toEntity() => SectionThreeEntity(
        title: title,
        cards: cards.map((e) => e.toEntity()).toList(),
      );
}

class SectionThreeCardModel {
  final String icon;
  final String title;
  final String description;

  SectionThreeCardModel({
    required this.icon,
    required this.title,
    required this.description,
  });

  factory SectionThreeCardModel.fromJson(Map<String, dynamic> json) {
    return SectionThreeCardModel(
      icon: json['icon'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  SectionThreeCardEntity toEntity() => SectionThreeCardEntity(
        icon: icon,
        title: title,
        description: description,
      );
}

class SectionFourModel {
  final String title;
  final List<SectionFourServiceModel> services;

  SectionFourModel({
    required this.title,
    required this.services,
  });

  factory SectionFourModel.fromJson(Map<String, dynamic> json) {
    return SectionFourModel(
      title: json['title'] ?? '',
      services: (json['services'] as List<dynamic>?)
              ?.map((e) => SectionFourServiceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  SectionFourEntity toEntity() => SectionFourEntity(
        title: title,
        services: services.map((e) => e.toEntity()).toList(),
      );
}

class SectionFourServiceModel {
  final int id;
  final String image;
  final String title;
  final String price;
  final String rating;

  SectionFourServiceModel({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
  });

  factory SectionFourServiceModel.fromJson(Map<String, dynamic> json) {
    return SectionFourServiceModel(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      price: json['price']?.toString() ?? '0',
      rating: json['rating']?.toString() ?? '0.0',
    );
  }

  SectionFourServiceEntity toEntity() => SectionFourServiceEntity(
        id: id,
        image: image,
        title: title,
        price: price,
        rating: rating,
      );
}

class OrderButtonModel {
  final String text;
  final String url;

  OrderButtonModel({
    required this.text,
    required this.url,
  });

  factory OrderButtonModel.fromJson(Map<String, dynamic> json) {
    return OrderButtonModel(
      text: json['text'] ?? '',
      url: json['url'] ?? '',
    );
  }

  OrderButtonEntity toEntity() => OrderButtonEntity(
        text: text,
        url: url,
      );
}

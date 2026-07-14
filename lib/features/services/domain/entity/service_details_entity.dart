class ServiceDetailsEntity {
  final SectionOneEntity sectionOne;
  final SectionTwoEntity sectionTwo;
  final SectionThreeEntity sectionThree;
  final SectionFourEntity sectionFour;
  final OrderButtonEntity orderButton;

  ServiceDetailsEntity({
    required this.sectionOne,
    required this.sectionTwo,
    required this.sectionThree,
    required this.sectionFour,
    required this.orderButton,
  });
}

class SectionOneEntity {
  final int id;
  final String image;
  final String category;
  final String title;
  final String description;
  final String price;
  final String rating;
  final int reviews;
  final String duration;

  SectionOneEntity({
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
}

class SectionTwoEntity {
  final String title;
  final List<SectionTwoItemEntity> items;

  SectionTwoEntity({
    required this.title,
    required this.items,
  });
}

class SectionTwoItemEntity {
  final String icon;
  final String? title;

  SectionTwoItemEntity({
    required this.icon,
    this.title,
  });
}

class SectionThreeEntity {
  final String title;
  final List<SectionThreeCardEntity> cards;

  SectionThreeEntity({
    required this.title,
    required this.cards,
  });
}

class SectionThreeCardEntity {
  final String icon;
  final String title;
  final String description;

  SectionThreeCardEntity({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class SectionFourEntity {
  final String title;
  final List<SectionFourServiceEntity> services;

  SectionFourEntity({
    required this.title,
    required this.services,
  });
}

class SectionFourServiceEntity {
  final int id;
  final String image;
  final String title;
  final String price;
  final String rating;

  SectionFourServiceEntity({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
  });
}

class OrderButtonEntity {
  final String text;
  final String url;

  OrderButtonEntity({
    required this.text,
    required this.url,
  });
}

class ServiceEntity {
  final int id;
  final String name;
  final String shortDescription;
  final String icon;
  final double price;
  final String priceLabel;
  final String slug;
  final String buttonText;
  final String detailsUrl;

  ServiceEntity({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.icon,
    required this.price,
    required this.priceLabel,
    required this.slug,
    required this.buttonText,
    required this.detailsUrl,
  });
}

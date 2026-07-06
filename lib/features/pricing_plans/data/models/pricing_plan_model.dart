class PricingPlanModel {
  final int index; // Added to help with UI toggle selection
  final int id;
  final String name;
  final String slug;
  final String? description;
  final String? shortDescription;
  final String? price;
  final String currency;
  final String billingInterval;
  final int? leadLimit;
  final int? whatsappLimit;
  final int? userLimit;
  final List<String> features;
  final String? badge;
  final PlanButtonModel? button;
  final String? icon;
  final String? highlight;
  final bool isPopular;
  final bool isActive;
  final int sortOrder;

  const PricingPlanModel({
    required this.index,
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    this.shortDescription,
    this.price,
    required this.currency,
    required this.billingInterval,
    this.leadLimit,
    this.whatsappLimit,
    this.userLimit,
    required this.features,
    this.badge,
    this.button,
    this.icon,
    this.highlight,
    required this.isPopular,
    required this.isActive,
    required this.sortOrder,
  });

  factory PricingPlanModel.fromJson(Map<String, dynamic> json, {int index = 0}) {
    return PricingPlanModel(
      index: index,
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String?,
      shortDescription: json['short_description'] as String?,
      price: json['price']?.toString(),
      currency: json['currency'] as String? ?? 'USD',
      billingInterval: json['billing_interval'] as String? ?? 'month',
      leadLimit: json['lead_limit'] as int?,
      whatsappLimit: json['whatsapp_limit'] as int?,
      userLimit: json['user_limit'] as int?,
      features: (json['features'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      badge: json['badge'] as String?,
      button: json['button'] != null ? PlanButtonModel.fromJson(json['button']) : null,
      icon: json['icon'] as String?,
      highlight: json['highlight'] as String?,
      isPopular: json['is_popular'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? true,
      sortOrder: json['sort_order'] as int? ?? 0,
    );
  }
}

class PlanButtonModel {
  final String? text;
  final String? action;
  final String? type;

  const PlanButtonModel({this.text, this.action, this.type});

  factory PlanButtonModel.fromJson(Map<String, dynamic> json) {
    return PlanButtonModel(
      text: json['text'] as String?,
      action: json['action'] as String?,
      type: json['type'] as String?,
    );
  }
}

class PlanComparisonModel {
  final String sectionTitle;
  final String sectionDescription;
  final PlanComparisonHeader header;
  final PlanComparisonBody body;

  const PlanComparisonModel({
    required this.sectionTitle,
    required this.sectionDescription,
    required this.header,
    required this.body,
  });

  factory PlanComparisonModel.fromJson(Map<String, dynamic> json) {
    return PlanComparisonModel(
      sectionTitle: json['sectionTitle'] as String? ?? '',
      sectionDescription: json['sectionDescription'] as String? ?? '',
      header: json['header'] != null
          ? PlanComparisonHeader.fromJson(json['header'])
          : const PlanComparisonHeader(plans: []),
      body: json['body'] != null
          ? PlanComparisonBody.fromJson(json['body'])
          : const PlanComparisonBody(sections: []),
    );
  }
}

class PlanComparisonHeader {
  final List<PlanComparisonHeaderItem> plans;

  const PlanComparisonHeader({required this.plans});

  factory PlanComparisonHeader.fromJson(Map<String, dynamic> json) {
    return PlanComparisonHeader(
      plans: (json['plans'] as List<dynamic>?)
              ?.map((e) => PlanComparisonHeaderItem.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class PlanComparisonHeaderItem {
  final String key;
  final String? badge;
  final String name;
  final String? price;
  final bool popular;

  const PlanComparisonHeaderItem({
    required this.key,
    this.badge,
    required this.name,
    this.price,
    required this.popular,
  });

  factory PlanComparisonHeaderItem.fromJson(Map<String, dynamic> json) {
    return PlanComparisonHeaderItem(
      key: json['key'] as String? ?? '',
      badge: json['badge'] as String?,
      name: json['name'] as String? ?? '',
      price: json['price'] as String?,
      popular: json['popular'] as bool? ?? false,
    );
  }
}

class PlanComparisonBody {
  final List<PlanComparisonSection> sections;

  const PlanComparisonBody({required this.sections});

  factory PlanComparisonBody.fromJson(Map<String, dynamic> json) {
    return PlanComparisonBody(
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => PlanComparisonSection.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class PlanComparisonSection {
  final String type;
  final String title;
  final List<PlanComparisonRow> rows;

  const PlanComparisonSection({
    required this.type,
    required this.title,
    required this.rows,
  });

  factory PlanComparisonSection.fromJson(Map<String, dynamic> json) {
    return PlanComparisonSection(
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      rows: (json['rows'] as List<dynamic>?)
              ?.map((e) => PlanComparisonRow.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class PlanComparisonRow {
  final String type;
  final String feature;
  final Map<String, PlanComparisonValue> values;

  const PlanComparisonRow({
    required this.type,
    required this.feature,
    required this.values,
  });

  factory PlanComparisonRow.fromJson(Map<String, dynamic> json) {
    final valuesMap = json['values'] as Map<String, dynamic>? ?? {};
    final mappedValues = <String, PlanComparisonValue>{};
    
    valuesMap.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        mappedValues[key] = PlanComparisonValue.fromJson(value);
      }
    });

    return PlanComparisonRow(
      type: json['type'] as String? ?? '',
      feature: json['feature'] as String? ?? '',
      values: mappedValues,
    );
  }
}

class PlanComparisonValue {
  final String key;
  final String type;
  final String? value;

  const PlanComparisonValue({
    required this.key,
    required this.type,
    this.value,
  });

  factory PlanComparisonValue.fromJson(Map<String, dynamic> json) {
    return PlanComparisonValue(
      key: json['key'] as String? ?? '',
      type: json['type'] as String? ?? '',
      value: json['value']?.toString(),
    );
  }
}

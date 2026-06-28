class PricingPlanModel {
  final int index;
  final String title;
  final String description;
  final String price;
  final String period;
  final List<String> features;

  const PricingPlanModel({
    required this.index,
    required this.title,
    required this.description,
    required this.price,
    required this.period,
    required this.features,
  });

  // توليد داتا تجريبية (Mock Data) للباكات
  static List<PricingPlanModel> getMockPlans() {
    return const [
      PricingPlanModel(
        index: 0,
        title: "الأساسية",
        description: "للبدء وإدارة الأعمال الصغيرة",
        price: "\$499",
        period: "شهريا",
        features: [
          "إدارة حتى 50 حملة",
          "إدارة مستخدم واحد أو فريق صغير",
          "قوالب جاهزة للتسويق",
          "تقارير أساسية للأداء",
        ],
      ),
      PricingPlanModel(
        index: 1,
        title: "الإحترافية",
        description: "لتنمية الأعمال وإدارة حملات متقدمة",
        price: "\$899",
        period: "شهريا",
        features: [
          "إدارة حتى 200 حملة",
          "إدارة فريق يصل إلى 5 مستخدمين",
          "قوالب تسويق مخصصة",
          "تقارير متقدمة وتحليلات",
        ],
      ),
      PricingPlanModel(
        index: 2,
        title: "المؤسسية",
        description: "حلول شاملة للشركات الكبيرة",
        price: "\$1499",
        period: "شهريا",
        features: [
          "إدارة حملات غير محدودة",
          "إدارة فريق غير محدود",
          "دعم فني على مدار الساعة",
          "تقارير مخصصة وتحليلات متقدمة",
        ],
      ),
    ];
  }
}
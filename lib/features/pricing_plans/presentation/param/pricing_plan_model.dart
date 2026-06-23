class PricingPlanModel {
  final int index;
  final String title;
  final String description;

  const PricingPlanModel({
    required this.index,
    required this.title,
    required this.description,
  });

  // توليد داتا تجريبية (Mock Data) مطابقة للـ Tabs
  static List<PricingPlanModel> getMockPlans() {
    return const [
      PricingPlanModel(
        index: 0,
        title: "الباقة الأساسية",
        description: "تفاصيل ومميزات الباقة الأساسية الخاصة بنمو نشاطك المبتدئ",
      ),
      PricingPlanModel(
        index: 1,
        title: "الباقة الاحترافية",
        description: "تفاصيل ومميزات الباقة الاحترافية المتكاملة لحملاتك التسويقية الكبيرة",
      ),
      PricingPlanModel(
        index: 2,
        title: "الباقة المؤسسية",
        description: "تفاصيل ومميزات الباقة المؤسسية المخصصة للشركات والمجموعات الضخمة",
      ),
    ];
  }
}
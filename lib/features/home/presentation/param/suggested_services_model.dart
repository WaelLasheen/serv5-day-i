class SuggestedServiceModel {
  final String imageUrl;
  final String tag;
  final String title;
  final String price;
  final String duration;
  final int rating;

  const SuggestedServiceModel({
    required this.imageUrl,
    required this.tag,
    required this.title,
    required this.price,
    required this.duration,
    required this.rating,
  });

  // توليد البيانات الثابتة الخاصة بالفيجما داخل الموديل
  static List<SuggestedServiceModel> getMockServices() {
    return const [
      SuggestedServiceModel(
        imageUrl: '',
        tag: 'التصميم',
        title: 'تصميم المواقع والتطبيقات',
        price: '5000ج',
        duration: '12 أيام',
        rating: 5,
      ),
      SuggestedServiceModel(
        imageUrl: "",
        tag: 'الإعلانات الرقمية',
        title: 'تنفيذ حملات إعلانية مدفوعة',
        price: '3000ج',
        duration: '7 أيام',
        rating: 5,
      ),
    ];
  }
}

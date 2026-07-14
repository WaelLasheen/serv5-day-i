import 'package:day_i/generated/l10n.dart';

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

  static List<SuggestedServiceModel> getMockServices() {
    return [
      SuggestedServiceModel(
        imageUrl: '',
        tag: S.current.mockSuggestedServiceTag1,
        title: S.current.mockSuggestedServiceTitle1,
        price: '5000',
        duration: S.current.mockDuration12Days,
        rating: 5,
      ),
      SuggestedServiceModel(
        imageUrl: "",
        tag: S.current.mockSuggestedServiceTag2,
        title: S.current.mockSuggestedServiceTitle2,
        price: '3000',
        duration: S.current.mockDuration7Days,
        rating: 5,
      ),
    ];
  }
}

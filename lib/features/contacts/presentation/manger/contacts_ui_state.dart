import 'package:day_i/features/contacts/data/models/faq_model.dart';

class ContactsUiState {
  final int tabIndex;
  final int expandedFaqIndex;
  final List<FaqModel> faqs;
  final bool isLoading;

  final int currentPage;
  final bool hasReachedMax;
  final bool isFetchingMore;

  const ContactsUiState({
    this.tabIndex = 0,
    this.expandedFaqIndex = -1,
    this.faqs = const [],
    this.isLoading = true,
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.isFetchingMore = false,
  });

  ContactsUiState copyWith({
    int? tabIndex,
    int? expandedFaqIndex,
    List<FaqModel>? faqs,
    bool? isLoading,
    int? currentPage,
    bool? hasReachedMax,
    bool? isFetchingMore,
  }) {
    return ContactsUiState(
      tabIndex: tabIndex ?? this.tabIndex,
      expandedFaqIndex: expandedFaqIndex ?? this.expandedFaqIndex,
      faqs: faqs ?? this.faqs,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
    );
  }
}

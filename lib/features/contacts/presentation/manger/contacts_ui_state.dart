import 'package:day_i/features/contacts/data/models/faq_model.dart';
import 'package:day_i/features/contacts/data/models/contact_info_model.dart';

class ContactsUiState {
  final int tabIndex;
  final int expandedFaqIndex;
  final List<FaqModel> faqs;
  final bool isLoading;
  
  final ContactInfoModel? contactInfo;
  final bool isContactInfoLoading;

  final int currentPage;
  final bool hasReachedMax;
  final bool isFetchingMore;

  const ContactsUiState({
    this.tabIndex = 0,
    this.expandedFaqIndex = -1,
    this.faqs = const [],
    this.isLoading = true,
    this.contactInfo,
    this.isContactInfoLoading = false,
    this.currentPage = 1,
    this.hasReachedMax = false,
    this.isFetchingMore = false,
  });

  ContactsUiState copyWith({
    int? tabIndex,
    int? expandedFaqIndex,
    List<FaqModel>? faqs,
    bool? isLoading,
    ContactInfoModel? contactInfo,
    bool? isContactInfoLoading,
    int? currentPage,
    bool? hasReachedMax,
    bool? isFetchingMore,
  }) {
    return ContactsUiState(
      tabIndex: tabIndex ?? this.tabIndex,
      expandedFaqIndex: expandedFaqIndex ?? this.expandedFaqIndex,
      faqs: faqs ?? this.faqs,
      isLoading: isLoading ?? this.isLoading,
      contactInfo: contactInfo ?? this.contactInfo,
      isContactInfoLoading: isContactInfoLoading ?? this.isContactInfoLoading,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
    );
  }
}


import 'package:day_i/features/contacts/data/models/faq_model.dart';

class ContactsUiState {
  final int tabIndex;
  final int expandedFaqIndex;
  final List<FaqModel> faqs;

  const ContactsUiState({
    this.tabIndex = 0,
    this.expandedFaqIndex = 0,
    this.faqs = const [],
  });

  ContactsUiState copyWith({
    int? tabIndex,
    int? expandedFaqIndex,
    List<FaqModel>? faqs,
  }) {
    return ContactsUiState(
      tabIndex: tabIndex ?? this.tabIndex,
      expandedFaqIndex: expandedFaqIndex ?? this.expandedFaqIndex,
      faqs: faqs ?? this.faqs,
    );
  }
}

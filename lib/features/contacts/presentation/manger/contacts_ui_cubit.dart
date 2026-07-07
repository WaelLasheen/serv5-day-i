import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/contacts/data/repos/contacts_repo.dart';
import 'contacts_ui_state.dart';

class ContactsUiCubit extends Cubit<ContactsUiState> {
  final ContactsRepo contactsRepo;

  ContactsUiCubit(this.contactsRepo) : super(const ContactsUiState()) {
    loadFaqs();
    loadContactInfo();
  }

  Future<void> loadContactInfo() async {
    emit(state.copyWith(isContactInfoLoading: true));
    final result = await contactsRepo.getContactInfo();
    result.fold(
      (failure) {
        emit(state.copyWith(isContactInfoLoading: false));
      },
      (contactInfo) {
        emit(state.copyWith(
          contactInfo: contactInfo,
          isContactInfoLoading: false,
        ));
      },
    );
  }


  Future<void> loadFaqs() async {
    emit(state.copyWith(
      isLoading: true,
      currentPage: 1,
      hasReachedMax: false,
      isFetchingMore: false,
    ));
    final result = await contactsRepo.getFaqs(page: 1);
    result.fold(
      (failure) {
        emit(state.copyWith(faqs: [], isLoading: false));
      },
      (faqs) {
        emit(state.copyWith(
          faqs: faqs,
          isLoading: false,
          hasReachedMax: faqs.isEmpty || faqs.length < 10,
        ));
      },
    );
  }

  Future<void> loadMoreFaqs() async {
    if (state.hasReachedMax || state.isFetchingMore || state.isLoading) return;

    emit(state.copyWith(isFetchingMore: true));
    final nextPage = state.currentPage + 1;
    final result = await contactsRepo.getFaqs(page: nextPage);
    
    result.fold(
      (failure) {
        emit(state.copyWith(isFetchingMore: false));
      },
      (newFaqs) {
        if (newFaqs.isEmpty) {
          emit(state.copyWith(hasReachedMax: true, isFetchingMore: false));
        } else {
          emit(state.copyWith(
            faqs: List.of(state.faqs)..addAll(newFaqs),
            currentPage: nextPage,
            isFetchingMore: false,
            hasReachedMax: newFaqs.length < 10,
          ));
        }
      },
    );
  }

  void changeTab(int index) {
    emit(state.copyWith(tabIndex: index));
  }

  void toggleFaq(int index) {
    if (state.expandedFaqIndex == index) {
      emit(state.copyWith(expandedFaqIndex: -1));
    } else {
      emit(state.copyWith(expandedFaqIndex: index));
    }
  }
}

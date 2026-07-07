import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/contacts/data/models/contact_request_model.dart';
import 'package:day_i/features/contacts/data/repos/contacts_repo.dart';
import 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  final ContactsRepo contactsRepo;

  ContactsCubit(this.contactsRepo) : super(ContactsInitial());

  Future<void> sendContactMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    emit(ContactsLoading());

    final request = ContactRequestModel(
      name: name,
      email: email,
      subject: subject,
      message: message,
    );

    final result = await contactsRepo.sendContactMessage(request);

    result.fold(
      (error) => emit(ContactsFailure(error)),
      (_) => emit(ContactsSuccess()),
    );
  }

  Future<void> getContactInfo() async {
    emit(ContactInfoLoading());
    final result = await contactsRepo.getContactInfo();
    result.fold(
      (error) => emit(ContactInfoFailure(error.message)),
      (info) => emit(ContactInfoSuccess(info)),
    );
  }
}

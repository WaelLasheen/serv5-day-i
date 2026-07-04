abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsLoading extends ContactsState {}

class ContactsSuccess extends ContactsState {}

class ContactsFailure extends ContactsState {
  final String error;
  ContactsFailure(this.error);
}

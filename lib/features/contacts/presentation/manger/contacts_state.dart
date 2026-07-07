import '../../data/models/contact_info_model.dart';

abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsLoading extends ContactsState {}

class ContactsSuccess extends ContactsState {}

class ContactsFailure extends ContactsState {
  final String error;
  ContactsFailure(this.error);
}

class ContactInfoLoading extends ContactsState {}

class ContactInfoSuccess extends ContactsState {
  final ContactInfoModel contactInfo;
  ContactInfoSuccess(this.contactInfo);
}

class ContactInfoFailure extends ContactsState {
  final String error;
  ContactInfoFailure(this.error);
}


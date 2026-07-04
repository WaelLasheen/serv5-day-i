import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day_i/features/contacts/data/models/faq_model.dart';
import 'contacts_ui_state.dart';

class ContactsUiCubit extends Cubit<ContactsUiState> {
  ContactsUiCubit() : super(const ContactsUiState()) {
    _loadFaqs();
  }

  void _loadFaqs() {
    // In a real scenario, this data would come from an API via a Repository
    final mockFaqs = [
      const FaqModel(
        question: 'هل إنشاء الشركة على المنصة مجاني؟',
        answer:
            'يمكنك استعراض الخدمات والأسعار، ويتم الدفع فقط عند حجز أي خدمة.',
      ),
      const FaqModel(
        question: 'هل الأسعار ثابتة أم قابلة للتخصيص؟',
        answer:
            'الأسعار ثابتة للخدمات الأساسية ويمكن تخصيصها حسب متطلبات شركتك.',
      ),
      const FaqModel(
        question: 'كيف أختار الخدمة المناسبة لشركتي؟',
        answer:
            'يمكنك التواصل مع فريق الدعم لدينا لمساعدتك في اختيار الخدمة الأنسب لاحتياجاتك.',
      ),
      const FaqModel(
        question: 'ماذا يحدث بعد حجز الخدمة؟',
        answer:
            'سيتم التواصل معك من قبل فريقنا المختص للبدء في تنفيذ الخدمة ومتابعة الخطوات.',
      ),
      const FaqModel(
        question: 'هل يمكن تعديل بيانات الشركة فيمابعد ؟',
        answer:
            'نعم، يمكنك تعديل بيانات شركتك في أي وقت من خلال لوحة التحكم الخاصة بك.',
      ),
    ];

    emit(state.copyWith(faqs: mockFaqs));
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

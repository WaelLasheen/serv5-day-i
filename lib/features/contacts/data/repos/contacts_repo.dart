import 'package:dartz/dartz.dart';
import '../models/contact_request_model.dart';

class ContactsRepo {
  Future<Either<String, bool>> sendContactMessage(
    ContactRequestModel request,
  ) async {
    try {
      // محاكاة تأخير الشبكة (Mock network delay)
      await Future.delayed(const Duration(seconds: 1));

      // يمكنك هنا إضافة كود الاتصال بالـ API الحقيقي
      // مثال: await dio.post('/contact', data: request.toJson());

      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

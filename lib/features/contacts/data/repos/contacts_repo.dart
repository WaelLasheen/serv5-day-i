import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/core/utils/errors/server_failure.dart';
import '../models/contact_request_model.dart';
import '../models/faq_model.dart';

class ContactsRepo {
  final IApiService apiService;

  ContactsRepo({required this.apiService});

  Future<Either<String, bool>> sendContactMessage(
    ContactRequestModel request,
  ) async {
    try {
      // محاكاة تأخير الشبكة (Mock network delay)
      await Future.delayed(const Duration(seconds: 1));

      // يمكنك هنا إضافة كود الاتصال بالـ API الحقيقي
      // مثال: await apiService.post('/contact', data: request.toJson());

      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<Failure, List<FaqModel>>> getFaqs({int page = 1}) async {
    try {
      final response = await apiService.get('${ApiConstants.faqs}?page=$page');
      return response.fold((l) => Left(l), (r) {
        final remoteData = r.data as Map<String, dynamic>;
        if (remoteData['status'] == true) {
          final List faqsJson = remoteData['data']?['data'] ?? [];
          final faqs = faqsJson.map((e) => FaqModel.fromJson(e)).toList();
          return Right(faqs);
        } else {
          return Left(ServerFailure(remoteData['message'] ?? 'Unknown Error'));
        }
      });
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, FaqModel>> addFaq(Map<String, dynamic> data) async {
    try {
      final response = await apiService.post(ApiConstants.faqs, data: data);
      return response.fold((l) => Left(l), (r) {
        final remoteData = r.data as Map<String, dynamic>;
        if (remoteData['status'] == true) {
          return Right(FaqModel.fromJson(remoteData['data'] ?? {}));
        } else {
          return Left(ServerFailure(remoteData['message'] ?? 'Unknown Error'));
        }
      });
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, FaqModel>> showFaq(int id) async {
    try {
      final response = await apiService.get('${ApiConstants.faqs}/$id');
      return response.fold((l) => Left(l), (r) {
        final remoteData = r.data as Map<String, dynamic>;
        if (remoteData['status'] == true) {
          return Right(FaqModel.fromJson(remoteData['data'] ?? {}));
        } else {
          return Left(ServerFailure(remoteData['message'] ?? 'Unknown Error'));
        }
      });
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, FaqModel>> updateFaq(int id, Map<String, dynamic> data) async {
    try {
      final response = await apiService.put('${ApiConstants.faqs}/$id', data: data);
      return response.fold((l) => Left(l), (r) {
        final remoteData = r.data as Map<String, dynamic>;
        if (remoteData['status'] == true) {
          return Right(FaqModel.fromJson(remoteData['data'] ?? {}));
        } else {
          return Left(ServerFailure(remoteData['message'] ?? 'Unknown Error'));
        }
      });
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteFaq(int id) async {
    try {
      final response = await apiService.delete('${ApiConstants.faqs}/$id');
      return response.fold((l) => Left(l), (r) {
        final remoteData = r.data as Map<String, dynamic>;
        if (remoteData['status'] == true) {
          return const Right(null);
        } else {
          return Left(ServerFailure(remoteData['message'] ?? 'Unknown Error'));
        }
      });
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

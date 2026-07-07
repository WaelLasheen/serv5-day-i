import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/core/utils/errors/server_failure.dart';
import '../models/contact_request_model.dart';
import '../models/faq_model.dart';

import '../models/contact_info_model.dart';

class ContactsRepo {
  final IApiService apiService;

  ContactsRepo({required this.apiService});

  Future<Either<String, bool>> sendContactMessage(
    ContactRequestModel request,
  ) async {
    try {
      final response = await apiService.post(ApiConstants.contactMessages, data: request.toJson());
      return response.fold((l) => Left(l.message), (r) {
        final remoteData = r.data as Map<String, dynamic>;
        if (remoteData['success'] == true) {
          return const Right(true);
        } else {
          return Left(remoteData['message'] ?? 'Unknown Error');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<Failure, ContactInfoModel>> getContactInfo() async {
    try {
      // We pass the full URL directly, the apiService should be able to handle it
      // if it uses Dio, Dio handles full URLs properly even if baseUrl is set.
      final response = await apiService.get(ApiConstants.contactInfo);
      return response.fold((l) => Left(l), (r) {
        final remoteData = r.data as Map<String, dynamic>;
        if (remoteData['success'] == true) {
          final data = remoteData['data'];
          if (data is List && data.isNotEmpty) {
            return Right(ContactInfoModel.fromJson(data[0] ?? {}));
          } else if (data is Map<String, dynamic>) {
            return Right(ContactInfoModel.fromJson(data));
          } else {
            return Right(ContactInfoModel(phone: '', email: '', address: ''));
          }
        } else {
          return Left(ServerFailure(remoteData['message'] ?? 'Unknown Error'));
        }
      });
    } catch (e) {
      return Left(ServerFailure(e.toString()));
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

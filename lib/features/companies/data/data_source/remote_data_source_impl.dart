import 'package:dartz/dartz.dart';
import 'package:day_i/core/networking/api_constants.dart';
import 'package:day_i/core/networking/i_api_service.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/companies/data/data_source/remote_data_source.dart';
import 'package:day_i/features/companies/data/model/company_model.dart';
import 'package:day_i/features/companies/domain/params/company_params.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final IApiService _apiService;

  RemoteDataSourceImpl({required IApiService apiService})
    : _apiService = apiService;

  @override
  Future<Either<Failure, CompanyModel>> createCompany(
    CompanyParams params,
  ) async {
    final result = await _apiService.post(
      ApiConstants.companies,
      data: params.toJson(),
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(CompanyModel.fromJson(response.data)),
    );
  }

  @override
  Future<Either<Failure, void>> deleteCompany(int id) async {
    final result = await _apiService.delete(' ${ApiConstants.companies}/$id');

    return result.fold((failure) => Left(failure), (response) => Right(null));
  }

  List<dynamic> _extractList(dynamic responseData) {
    if (responseData is List) {
      return responseData;
    }
    if (responseData is Map) {
      final data = responseData['data'] ?? responseData['companies'];
      if (data is List) {
        return data;
      }
    }
    return [];
  }

  @override
  Future<Either<Failure, List<CompanyModel>>> getCompanies() async {
    final result = await _apiService.get(ApiConstants.companies);

    return result.fold(
      (failure) => Left(failure),
      (response) {
        final list = _extractList(response.data);
        return Right(
          list.map((e) => CompanyModel.fromJson(e)).toList(),
        );
      },
    );
  }

  @override
  Future<Either<Failure, CompanyModel>> updateCompany(
    CompanyParams params,
    int id,
  ) async {
    final result = await _apiService.put(
      ' ${ApiConstants.companies}/$id',
      data: params.toJson(),
    );

    return result.fold(
      (failure) => Left(failure),
      (response) => Right(CompanyModel.fromJson(response.data)),
    );
  }
}

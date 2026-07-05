import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/companies/data/data_source/remote_data_source.dart';
import 'package:day_i/features/companies/domain/entity/company_entity.dart';
import 'package:day_i/features/companies/domain/params/company_params.dart';
import 'package:day_i/features/companies/domain/repository/companies_repository.dart';

class CompaniesRepositoryImpl implements CompaniesRepository {
  final RemoteDataSource _remoteDataSource;

  CompaniesRepositoryImpl({required RemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;
  @override
  Future<Either<Failure, CompanyEntity>> createCompany(CompanyParams params) async {
    final result = await _remoteDataSource.createCompany(params);
    return result.map((r) => r.toEntity());
  }

  @override
  Future<Either<Failure, void>> deleteCompany(int id) async {
    return await _remoteDataSource.deleteCompany(id);
  }

  @override
  Future<Either<Failure, List<CompanyEntity>>> getCompanies() async {
    final result = await _remoteDataSource.getCompanies();
    return result.map((r) => r.map((e) => e.toEntity()).toList());
  }

  @override
  Future<Either<Failure, CompanyEntity>> updateCompany(
    CompanyParams params,
    int id,
  ) async {
    final result = await _remoteDataSource.updateCompany(params, id);
    return result.map((r) => r.toEntity());
  }
}

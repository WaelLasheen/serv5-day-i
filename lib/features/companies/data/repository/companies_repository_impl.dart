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
  Future<Either<Failure, CompanyEntity>> createCompany(CompanyParams params) {
    // TODO: implement createCompany
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteCompany(int id) {
    // TODO: implement deleteCompany
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CompanyEntity>>> getCompanies() {
    // TODO: implement getCompanies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CompanyEntity>> updateCompany(
    CompanyParams params,
    int id,
  ) {
    // TODO: implement updateCompany
    throw UnimplementedError();
  }
}

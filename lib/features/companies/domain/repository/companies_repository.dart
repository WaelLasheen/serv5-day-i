import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/companies/domain/entity/company_entity.dart';
import 'package:day_i/features/companies/domain/params/company_params.dart';

abstract class CompaniesRepository {
  Future<Either<Failure, List<CompanyEntity>>> getCompanies();
  Future<Either<Failure, CompanyEntity>> createCompany(CompanyParams params);
  Future<Either<Failure, CompanyEntity>> updateCompany(
    CompanyParams params,
    int id,
  );
  Future<Either<Failure, void>> deleteCompany(int id);
}

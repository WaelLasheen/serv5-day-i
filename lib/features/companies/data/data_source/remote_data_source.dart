import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/companies/data/model/company_model.dart';
import 'package:day_i/features/companies/domain/params/company_params.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, List<CompanyModel>>> getCompanies();
  Future<Either<Failure, CompanyModel>> createCompany(CompanyParams params);
  Future<Either<Failure, CompanyModel>> updateCompany(
    CompanyParams params,
    int id,
  );
  Future<Either<Failure, void>> deleteCompany(int id);
}

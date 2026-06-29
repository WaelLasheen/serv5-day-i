import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/auth/data/model/auth_model.dart';
import 'package:day_i/features/auth/domain/params/change_password_params.dart';
import 'package:day_i/features/auth/domain/params/login_params.dart';
import 'package:day_i/features/auth/domain/params/register_params.dart';
import 'package:day_i/features/auth/domain/params/send_otp_params.dart';
import 'package:day_i/features/auth/domain/params/verify_params.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, AuthModel>> login(LoginParams params);
  Future<Either<Failure, AuthModel>> register(RegisterParams params);
  Future<Either<Failure, void>> sendOtp(SendOtpParams params);
  Future<Either<Failure, void>> verify(VerifyParams params);
  Future<Either<Failure, void>> changePassword(ChangePasswordParams params);
}

import 'package:dartz/dartz.dart';
import 'package:day_i/core/utils/errors/failure.dart';
import 'package:day_i/features/auth/domain/params/send_otp_params.dart';
import 'package:day_i/features/auth/domain/repository/repository.dart';

class SendOtpUseCase {
  final Repository repository;
  SendOtpUseCase({required this.repository});

  Future<Either<Failure, void>> call(SendOtpParams params) {
    return repository.sendOtp(params);
  }
}
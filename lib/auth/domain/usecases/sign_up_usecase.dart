import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/auth/domain/repository/base_auth_repository.dart';
import 'package:to_do_app/core/error/failure.dart';
import 'package:to_do_app/core/usecase/base_usecase.dart';

class SignUpUseCase extends BaseUseCase<UserCredential, SignUpParameters> {
  final BaseAuthRepository baseAuthRepository;

  SignUpUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, UserCredential>> call(
      SignUpParameters parameters) async {
    return await baseAuthRepository.signUP(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String fullName;
  final String email;
  final String password;

  const SignUpParameters({
    required this.fullName,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [fullName, email, password];
}

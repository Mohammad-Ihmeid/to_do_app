// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/auth/domain/repository/base_auth_repository.dart';
import 'package:to_do_app/core/error/failure.dart';

import 'package:to_do_app/core/usecase/base_usecase.dart';

class SignInUseCase extends BaseUseCase<UserCredential, SignInParameters> {
  final BaseAuthRepository baseAuthRepository;

  SignInUseCase(this.baseAuthRepository);

  @override
  Future<Either<Failure, UserCredential>> call(
      SignInParameters parameters) async {
    return await baseAuthRepository.signIn(parameters);
  }
}

class SignInParameters extends Equatable {
  final String email;
  final String passWord;

  const SignInParameters({required this.email, required this.passWord});

  @override
  List<Object> get props => [email, passWord];
}

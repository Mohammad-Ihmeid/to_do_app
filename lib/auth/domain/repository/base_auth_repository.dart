import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/auth/domain/usecases/sign_up_usecase.dart';
import 'package:to_do_app/core/error/failure.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, UserCredential>> signUP(SignUpParameters parameters);
}

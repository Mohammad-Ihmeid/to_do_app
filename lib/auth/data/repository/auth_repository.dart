import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/auth/data/datasource/auth_firebase_source.dart';
import 'package:to_do_app/auth/domain/repository/base_auth_repository.dart';
import 'package:to_do_app/auth/domain/usecases/sign_in_usecase.dart';
import 'package:to_do_app/auth/domain/usecases/sign_up_usecase.dart';
import 'package:to_do_app/core/error/failure.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthFirebaseSource baseAuthFirebaseSource;

  AuthRepository(this.baseAuthFirebaseSource);
  @override
  Future<Either<Failure, UserCredential>> signUP(
      SignUpParameters parameters) async {
    try {
      final result = await baseAuthFirebaseSource.signUP(parameters);
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(RemoteFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signIn(
      SignInParameters parameters) async {
    try {
      final result = await baseAuthFirebaseSource.signIn(parameters);
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(RemoteFailure(failure.message!));
    }
  }
}

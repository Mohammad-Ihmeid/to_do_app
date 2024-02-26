import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/auth/domain/repository/base_auth_repository.dart';
import 'package:to_do_app/auth/domain/usecases/sign_up_usecase.dart';
import 'package:to_do_app/core/error/failure.dart';

class AuthRepository extends BaseAuthRepository {
  @override
  Future<Either<Failure, UserCredential>> signUP(
      SignUpParameters parameters) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: parameters.email,
        password: parameters.password,
      );
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(RemoteFailure(failure.message!));
    }
  }
}

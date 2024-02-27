import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/auth/domain/usecases/sign_in_usecase.dart';
import 'package:to_do_app/auth/domain/usecases/sign_up_usecase.dart';

abstract class BaseAuthFirebaseSource {
  Future<UserCredential> signUP(SignUpParameters parameters);

  Future<UserCredential> signIn(SignInParameters parameters);
}

class AuthFirebaseSource extends BaseAuthFirebaseSource {
  @override
  Future<UserCredential> signUP(SignUpParameters parameters) async {
    final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    );

    return result;
  }

  @override
  Future<UserCredential> signIn(SignInParameters parameters) async {
    final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: parameters.email,
      password: parameters.passWord,
    );

    return result;
  }
}

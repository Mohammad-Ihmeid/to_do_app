import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/auth/domain/usecases/sign_in_usecase.dart';
import 'package:to_do_app/auth/domain/usecases/sign_up_usecase.dart';
import 'package:to_do_app/core/utils/enums.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SignUpUseCase signUpUseCase;
  SignInUseCase signInUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  AuthBloc(this.signUpUseCase, this.signInUseCase) : super(const AuthState()) {
    on<SignUPEvent>(_signUPEvent);

    on<SignInEvent>(_signInEvent);
  }

  FutureOr<void> _signInEvent(event, emit) async {
    emit(state.copyWith(requestSignInState: ButtonRequestState.loading));

    final result = await signInUseCase(
      SignInParameters(
        email: emailController.text,
        passWord: passwordController.text,
      ),
    );

    result.fold((l) {
      emit(state.copyWith(
        requestSignInState: ButtonRequestState.error,
        errorSignIn: l.message,
      ));
    }, (r) {
      emit(
        state.copyWith(
          requestSignInState: ButtonRequestState.success,
        ),
      );
    });
  }

  FutureOr<void> _signUPEvent(event, emit) async {
    emit(state.copyWith(requestSignUpState: ButtonRequestState.loading));
    final db = FirebaseFirestore.instance;
    final result = await signUpUseCase(
      SignUpParameters(
          fullName: fullNameController.text,
          email: emailController.text,
          password: passwordController.text),
    );
    result.fold((l) {
      emit(state.copyWith(
        requestSignUpState: ButtonRequestState.error,
        errorSignUp: l.message,
      ));
    }, (r) {
      db.collection("Users").doc("123").set({
        "Email": emailController.text,
        "Password": passwordController.text,
        "FullName": fullNameController.text
      });
      emit(
        state.copyWith(
          requestSignUpState: ButtonRequestState.success,
        ),
      );
    });
  }
}

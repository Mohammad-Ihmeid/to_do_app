import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/auth/domain/usecases/sign_up_usecase.dart';
import 'package:to_do_app/core/utils/enums.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SignUpUseCase signUpUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  AuthBloc(this.signUpUseCase) : super(const AuthState()) {
    on<SignUPEvent>((event, emit) async {
      emit(state.copyWith(requestSignUpState: ButtonRequestState.loading));

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
        emit(
          state.copyWith(
            requestSignUpState: ButtonRequestState.success,
          ),
        );
      });
    });
  }
}

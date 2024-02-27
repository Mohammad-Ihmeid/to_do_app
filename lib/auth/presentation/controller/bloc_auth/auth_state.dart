part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final ButtonRequestState requestSignUpState;
  final String errorSignUp;
  ///////////////////////////////////////
  final ButtonRequestState requestSignInState;
  final String errorSignIn;

  const AuthState({
    this.requestSignUpState = ButtonRequestState.normal,
    this.errorSignUp = '',
    ///////////////////////////////////////
    this.requestSignInState = ButtonRequestState.normal,
    this.errorSignIn = '',
  });

  AuthState copyWith({
    ButtonRequestState? requestSignUpState,
    String? errorSignUp,
    ///////////////////////////////////////
    ButtonRequestState? requestSignInState,
    String? errorSignIn,
  }) {
    return AuthState(
      requestSignUpState: requestSignUpState ?? this.requestSignUpState,
      errorSignUp: errorSignUp ?? this.errorSignUp,
      ///////////////////////////////////////
      requestSignInState: requestSignInState ?? this.requestSignInState,
      errorSignIn: errorSignIn ?? this.errorSignIn,
    );
  }

  @override
  List<Object> get props => [
        requestSignUpState,
        errorSignUp,
        requestSignInState,
        errorSignIn,
      ];
}

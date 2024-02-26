part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final ButtonRequestState requestSignUpState;
  final String errorSignUp;
  const AuthState({
    this.requestSignUpState = ButtonRequestState.normal,
    this.errorSignUp = '',
  });

  AuthState copyWith({
    ButtonRequestState? requestSignUpState,
    String? errorSignUp,
  }) {
    return AuthState(
      requestSignUpState: requestSignUpState ?? this.requestSignUpState,
      errorSignUp: errorSignUp ?? this.errorSignUp,
    );
  }

  @override
  List<Object> get props => [requestSignUpState, errorSignUp];
}

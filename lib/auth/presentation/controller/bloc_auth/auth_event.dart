part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {}

class SignUPEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

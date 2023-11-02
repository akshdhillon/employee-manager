part of 'bloc.dart';

abstract class LoginValidationState {
  const LoginValidationState();
}

class InitialState extends LoginValidationState {}

class ValidatedState extends LoginValidationState {
  ValidatedState();
}

class InvalidState extends LoginValidationState {
  final String message;

  InvalidState(this.message);
}

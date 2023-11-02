part of 'bloc.dart';

abstract class LoginValidationState {
  const LoginValidationState();
}

class InitialState extends LoginValidationState {}

class ValidatedState extends LoginValidationState {
  const ValidatedState();
}

class InvalidState extends LoginValidationState {
  final String message;

  const InvalidState(this.message);
}

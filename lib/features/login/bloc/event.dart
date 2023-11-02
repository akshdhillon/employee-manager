part of 'bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class EmailChangedEvent extends LoginEvent {
  final String text;

  const EmailChangedEvent(this.text);
}

class PasswordChangedEvent extends LoginEvent {
  final String text;

  const PasswordChangedEvent(this.text);
}

class LoginPressedEvent extends LoginEvent {}

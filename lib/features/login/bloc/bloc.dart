import 'dart:async';

import 'package:bloc/bloc.dart';

part 'event.dart';
part 'state.dart';

class LoginValidationBloc extends Bloc<LoginEvent, LoginValidationState> {
  var isValidEmail = false, isValidPassword = false;

  LoginValidationBloc() : super(InitialState()) {
    on<EmailChangedEvent>(onEmailChanged);
    on<PasswordChangedEvent>(onPasswordChanged);
    on<LoginPressedEvent>(onLoginPressed);
  }

  FutureOr<void> onEmailChanged(
    EmailChangedEvent event,
    Emitter<LoginValidationState> emit,
  ) {
    final emailRegex = RegExp(
      r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$',
    );

    isValidEmail = emailRegex.hasMatch(event.text);
  }

  FutureOr<void> onPasswordChanged(
    PasswordChangedEvent event,
    Emitter<LoginValidationState> emit,
  ) {
    isValidPassword = event.text.length >= 6;
  }

  FutureOr<void> onLoginPressed(
    LoginPressedEvent event,
    Emitter<LoginValidationState> emit,
  ) {
    if (!isValidEmail) {
      emit(InvalidState('please enter a valid email'));
    } else if (!isValidPassword) {
      emit(InvalidState('please should be greater than 6 letters'));
    } else {
      emit(ValidatedState());
    }
  }
}

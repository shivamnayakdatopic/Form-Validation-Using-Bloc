part of 'signup_bloc_bloc.dart';

@immutable
abstract class SignupBlocEvent {}

class OnChangeField extends SignupBlocEvent {
  final String email;
  final String password;

  OnChangeField(
    this.email,
    this.password,
  );
}

class SignUpButton extends SignupBlocEvent {
  final String email;
  final String password;

  SignUpButton(this.email, this.password);
}

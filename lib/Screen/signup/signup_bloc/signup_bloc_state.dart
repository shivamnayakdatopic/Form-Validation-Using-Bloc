part of 'signup_bloc_bloc.dart';

@immutable
abstract class SignupBlocState {}

class SignupInitial extends SignupBlocState {}

class SignupValid extends SignupBlocState{}

class SignupError extends SignupBlocState{
  final String errorMessage;

  SignupError(this.errorMessage);
}


class SignupLoading extends SignupBlocState{}

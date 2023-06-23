import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signup_bloc_event.dart';
part 'signup_bloc_state.dart';

class SignupBlocBloc extends Bloc<SignupBlocEvent, SignupBlocState> {
  SignupBlocBloc() : super(SignupInitial()) {
    on<OnChangeField>((event, emit) {
      if (event.email == "" && EmailValidator.validate(event.email) == false) {
        emit(SignupError("Please enter valid email"));
      } else if (event.password.length <= 7) {
        emit(SignupError("Please enter valid password"));
      }else{
        emit(SignupValid());
      }
    });

    on<SignUpButton>((event, emit) {
      emit(SignupLoading());
    });
  }
}

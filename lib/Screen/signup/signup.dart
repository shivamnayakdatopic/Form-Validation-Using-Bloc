import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/Screen/signup/signup_bloc/signup_bloc_bloc.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController emailValue = TextEditingController();
  TextEditingController passwordValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Form Validation Using Bloc",
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<SignupBloc, SignupBlocState>(
                builder: (context, state) {
                  if (state is SignupError) {
                    return Text(
                      "${state.errorMessage}",
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              const SizedBox(height: 20.0),
              TextField(
                onChanged: (value) {
                  BlocProvider.of<SignupBloc>(context)
                      .add(OnChangeField(emailValue.text, passwordValue.text));
                },
                controller: emailValue,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                onChanged: (value) {
                  BlocProvider.of<SignupBloc>(context)
                      .add(OnChangeField(emailValue.text, passwordValue.text));
                },
                controller: passwordValue,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20.0),
              BlocBuilder<SignupBloc, SignupBlocState>(
                builder: (context, state) {
                  if (state is SignupLoading) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            (state is SignupValid) ? Colors.blue : Colors.grey),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      if (state is SignupValid) {
                        BlocProvider.of<SignupBloc>(context).add(
                            SignUpButton(emailValue.text, passwordValue.text));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

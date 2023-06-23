import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/Screen/signup/signup_bloc/signup_bloc_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
              BlocBuilder<SignupBlocBloc, SignupBlocState>(
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
              const TextField(
                // onChanged: (value) {
                //   BlocProvider.of<SignupBlocBloc>(context).add(OnChangeField(email,password));
                // },
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20.0),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () {
                  // Perform signup logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

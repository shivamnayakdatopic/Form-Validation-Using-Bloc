import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/Screen/signup/signup.dart';
import 'package:form_validation/Screen/signup/signup_bloc/signup_bloc_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validation Using Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  BlocProvider(
        create: (context) => SignupBlocBloc(),
        child: const SignUp(),
      ),
    );
  }
}

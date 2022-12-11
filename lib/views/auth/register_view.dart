import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokyo/app_ui.dart';
// import 'dart:developer' as devtools show log;

import 'package:sokyo/services/auth/auth_exceptions.dart';
import 'package:sokyo/services/auth/bloc/auth_bloc.dart';
import 'package:sokyo/services/auth/bloc/auth_event.dart';
import 'package:sokyo/services/auth/bloc/auth_state.dart';

import '../../services/auth/auth_service.dart';
import '../../utilities/dialog/error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  final AuthService authService = AuthService.firebase();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateRegistering) {
          if (state.exception is WeakPasswordAuthException) {
            await showErrorDialog(context, "Weak password");
          } else if (state.exception is EmailAlreadyInUseAuthException) {
            await showErrorDialog(context, "Email is already in use");
          } else if (state.exception is InvalidEmailAuthException) {
            await showErrorDialog(context, "Invalid email entered");
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(context, 'Authentication Error');
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Register")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text("Register"),
              Text(
                "Welcome to Sokyo!\n\n Create a new account to get started",
                style: SokyoTextStyle.headline5,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  controller: _email,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final email = _email.text;
                        final password = _password.text;
                        context
                            .read<AuthBloc>()
                            .add(AuthEventRegister(email, password));
                      },
                      child: const Text("Register"),
                    ),
                    const SizedBox(height: 16.0),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Already registered? ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Login here!",
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // devtools.log("Register here!");
                                context
                                    .read<AuthBloc>()
                                    .add(const AuthEventLogOut());
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

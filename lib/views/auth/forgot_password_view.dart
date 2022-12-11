import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokyo/services/auth/bloc/auth_bloc.dart';
import 'package:sokyo/services/auth/bloc/auth_event.dart';
import 'package:sokyo/services/auth/bloc/auth_state.dart';
import 'package:sokyo/utilities/dialog/error_dialog.dart';

import '../../utilities/dialog/password_reset_email_sent_dialog.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateForgotPassword) {
          if (state.hasSentEmail) {
            _textEditingController.clear();
            await showPasswordResetSentDialog(context);
          }
          if (state.exception != null) {
            await showErrorDialog(
                context, """We could not process your request. 
            Please ensure you are a registered user, or if not, register a user now 
            by going back.""");
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Forgot Password"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const Text(
                  'If you forgot your password, simply enter your email and we will send you a password reset link'),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Your email address...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  final email = _textEditingController.text;
                  context
                      .read<AuthBloc>()
                      .add(AuthEventForgotPassword(email: email));
                },
                child: const Text(
                  "Send me the password reset link",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          const AuthEventLogOut(),
                        );
                  },
                  child: const Text(
                    "Back to login page",
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

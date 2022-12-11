import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokyo/app_ui.dart';
// import 'package:sokyo/constants/routes.dart';
import 'package:sokyo/loading/loading_screen.dart';
import 'package:sokyo/services/auth/bloc/auth_bloc.dart';
import 'package:sokyo/services/auth/bloc/auth_event.dart';
import 'package:sokyo/services/auth/bloc/auth_state.dart';
import 'package:sokyo/services/auth/firebase_auth_provider.dart';
import 'package:sokyo/views.dart';

//* NOTE: TextEditingController for form fields
//* NOTE: AlertDialog makes a pop-up
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Sokyo',
    debugShowCheckedModeBanner: false,
    theme: SokyoTheme.standard,
    home: BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(FirebaseAuthProvider()),
      child: const HomePage(),
    ),
    routes: const {
      // createOrUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state.isLoading) {
        LoadingScreen().show(
            context: context,
            text: state.loadingText ?? "Please wait a moment");
      } else {
        LoadingScreen().hide();
      }
    }, builder: ((context, state) {
      // return const LoginView();
      if (state is AuthStateLoggedIn) {
        // context.read<AuthBloc>().add(const AuthEventLogOut());
        return const HomeView();
      } else if (state is AuthStateRegistering) {
        return const RegisterView();
      } else if (state is AuthStateNeedsVerification) {
        return const VerifyEmailView();
      } else if (state is AuthStateLoggedOut) {
        return const LoginView();
      } else if (state is AuthStateForgotPassword) {
        return const ForgotPasswordView();
      } else {
        return const Scaffold(
          body: CircularProgressIndicator(),
        );
      }
    }));
  }
}

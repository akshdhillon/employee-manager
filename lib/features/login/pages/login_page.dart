import 'package:employee_manager/features/dashboard/pages/dashboard_page.dart';
import 'package:employee_manager/features/login/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/login_form_field.dart';

class LoginPage extends StatefulWidget {
  static const route = '/';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginValidationBloc, LoginValidationState>(
      listener: (c, state) {
        if (state is InvalidState) {
          ScaffoldMessenger.of(context).clearSnackBars();

          final snackBar = SnackBar(content: Text(state.message));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          Navigator.of(context).pushReplacementNamed(
            DashboardPage.route,
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 52.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20.0),
              LoginFormField(
                controller: _emailController,
                hint: 'enter email',
                onChanged: (text) => context
                    .read<LoginValidationBloc>()
                    .add(EmailChangedEvent(text)),
              ),
              const SizedBox(height: 20.0),
              LoginFormField(
                obsecureText: true,
                controller: _passwordController,
                hint: 'enter password',
                onChanged: (text) => context
                    .read<LoginValidationBloc>()
                    .add(PasswordChangedEvent(text)),
              ),
              const SizedBox(height: 20.0),
              MaterialButton(
                color: Theme.of(context).colorScheme.primaryContainer,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                height: 44.0,
                onPressed: () => context
                    .read<LoginValidationBloc>()
                    .add(LoginPressedEvent()),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vehicle_rental_management_portal/data/repositories/auth_repository.dart';
import 'package:vehicle_rental_management_portal/pages/home/view/home_page.dart';
import 'package:vehicle_rental_management_portal/pages/login/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_rental_management_portal/utils/dialog_utils.dart';

import '../../../widgets/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) =>
            LoginCubit(authRepository: context.read<AuthRepository>()),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              showErrorDialog(context: context, message: state.error);
            }
            if (state is LoginSuccessState) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
          child: Scaffold(
            body: Center(
              child: Container(
                // color: Colors.amber,
                constraints: const BoxConstraints(maxWidth: 420),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Login',
                          style: GoogleFonts.roboto(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Builder(builder: (context) {
                      return CustomTextField(
                          onChanged: context.read<LoginCubit>().onEmailChanged,
                          hintext: 'Email');
                    }),
                    Builder(builder: (context) {
                      return CustomTextField(
                        onChanged: context.read<LoginCubit>().onPasswordChanged,
                        hintext: 'Password',
                        isPassword: true,
                      );
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    Builder(builder: (context) {
                      final isLoading = context.select<LoginCubit, bool>(
                          (value) => value.state is LoginLoadingState);
                      if (isLoading) {
                        return const SizedBox(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      return SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            context.read<LoginCubit>().onSubmit();
                          },
                          child: const Text('Login'),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/functions.dart';
import 'package:taalam/features/auth/data/repo/auth_repo.dart';
import 'package:taalam/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:taalam/features/auth/presentation/views/widgets/login_footer.dart';
import 'package:taalam/features/auth/presentation/views/widgets/login_form.dart';
import 'package:taalam/features/auth/presentation/views/widgets/login_header.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo()),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBg,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignInFailure) {
              snackBar(context: context, message: state.message);
            } else if (state is SignInSuccess) {
              snackBar(context: context, message: 'Login successful!', backgroundColor: Colors.green);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    LoginHeader(),
                    SizedBox(height: 50),
                    LoginForm(),
                    SizedBox(height: 40),
                    LoginFooter(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/functions.dart';
import 'package:taalam/features/auth/data/repo/auth_repo.dart';
import 'package:taalam/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:taalam/features/auth/presentation/views/widgets/register_footer.dart';
import 'package:taalam/features/auth/presentation/views/widgets/register_form.dart';
import 'package:taalam/features/auth/presentation/views/widgets/register_header.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
            snackBar(context: context, message: state.message);
          } else if (state is SignUpSuccess) {
            snackBar(context: context, message: 'Register Succesful!', backgroundColor: Colors.green);
          }
        },
        builder: (context, state) {
          return const Scaffold(
            backgroundColor: AppColors.scaffoldBg,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    RegisterHeader(),
                    SizedBox(height: 40),
                    RegisterForm(),
                    SizedBox(height: 20),
                    RegisterFooter(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

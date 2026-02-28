import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/features/auth/presentation/views/widgets/login_actions.dart';
import 'package:taalam/features/auth/presentation/views/widgets/login_footer.dart';
import 'package:taalam/features/auth/presentation/views/widgets/login_form.dart';
import 'package:taalam/features/auth/presentation/views/widgets/login_header.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              LoginHeader(),
              SizedBox(height: 40),
              LoginForm(),
              SizedBox(height: 20),
              LoginActions(),
              SizedBox(height: 40),
              LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
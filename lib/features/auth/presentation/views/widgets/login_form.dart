
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_icons.dart';
import 'package:taalam/core/constant/app_images.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/routing/routes.dart';
import 'package:taalam/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:taalam/features/auth/presentation/views/widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            hint: AppStrings.emailId,
            icon: AppIcons.email,
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hint: AppStrings.password,
            icon: AppIcons.passwordHidden,
            isPassword: true,
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                AppStrings.forgetPassword,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<AuthCubit>().signIn(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
              Navigator.pushNamed(context, AppRoutes.layoutView);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryPurple,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          child: const Text(AppStrings.signIn, style: TextStyle(color: Colors.white)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(AppStrings.or, style: TextStyle(color: AppColors.whiteColor)),
        ),
        OutlinedButton(
          onPressed: () {
           
          },
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 56),
            side: const BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              SvgPicture.asset(AppImages.googleImage, width: 15),
              const Text(AppStrings.googleSignIn, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        ],
      ),
    );
  }
}

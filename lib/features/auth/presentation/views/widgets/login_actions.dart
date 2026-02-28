import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_images.dart';
import 'package:taalam/core/constant/app_strings.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
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
          onPressed: () {},
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
    );
  }
}
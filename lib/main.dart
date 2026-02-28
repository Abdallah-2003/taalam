import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/features/auth/presentation/views/register_view.dart';

void main() {
  runApp(const Taalam());
}

class Taalam extends StatelessWidget {
  const Taalam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: const RegisterView(),
    );
  }
}

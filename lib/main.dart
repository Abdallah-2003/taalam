import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/networking/supabase_services.dart';
import 'package:taalam/features/auth/presentation/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseServices.init();
  runApp(const Taalam());
}

class Taalam extends StatelessWidget {
  const Taalam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: const LoginView(),
    );
  }
}

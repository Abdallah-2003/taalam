import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/core/bloc_observer.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/networking/supabase_services.dart';
import 'package:taalam/core/routing/app_router.dart';
import 'package:taalam/core/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseServices.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Taalam());
}

class Taalam extends StatelessWidget {
  const Taalam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.scaffoldBg,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      initialRoute: AppRoutes.myCoursesView,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

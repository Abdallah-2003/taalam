import 'package:flutter/material.dart';
import 'package:taalam/core/routing/routes.dart';
import 'package:taalam/features/auth/presentation/views/login_view.dart';
import 'package:taalam/features/auth/presentation/views/register_view.dart';
import 'package:taalam/features/course_details/presentation/views/course_details_view.dart';
import 'package:taalam/features/home/data/model/courses_model.dart';
import 'package:taalam/features/home/presentation/views/home_view.dart';
import 'package:taalam/features/layout/presentation/views/layout_nav_bar.dart';


abstract class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeView:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        );

      case AppRoutes.loginView:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginView();
          },
        );

      case AppRoutes.registerView:
        return MaterialPageRoute(
          builder: (context) {
            return const RegisterView();
          },
        );

      case AppRoutes.courseDetailsView:
      final coursesModel = settings.arguments as CoursesModel;
        return MaterialPageRoute(
          builder: (context) {
            return  CourseDetailsView(coursesModel: coursesModel);
          },
        );

      case AppRoutes.layoutView:
        return MaterialPageRoute(
          builder: (context) {
            return const LayoutNavBar();
          },
        );

      case AppRoutes.myCoursesView:
        return MaterialPageRoute(
          builder: (context) {
            return const LayoutNavBar(); 
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No routes defined for ${settings.name}')),
          ),
        );
    }
  }
}

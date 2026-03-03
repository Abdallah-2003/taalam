import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_icons.dart';
import 'package:taalam/core/constant/app_strings.dart';

class LayoutNavBar extends StatelessWidget {
  const LayoutNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(AppIcons.home), label: AppStrings.home),
          BottomNavigationBarItem(icon: Icon(AppIcons.book), label: AppStrings.myCourses),
          BottomNavigationBarItem(icon: Icon(AppIcons.profile), label: AppStrings.profile),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_icons.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/theme/text_styles.dart';
import 'package:taalam/features/layout/presentation/cubit/layout_cubit/layout_cubit.dart';
import 'package:taalam/features/layout/presentation/cubit/layout_cubit/layout_states.dart';

class LayoutNavBar extends StatelessWidget {
  const LayoutNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return Scaffold(
            body: context.read<LayoutCubit>().views[context.read<LayoutCubit>().currentIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.15), 
                    spreadRadius: 10,
                    blurRadius: 20,
                    offset: const Offset(0, -2),
                  )
                ]
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: BottomNavigationBar(
                  currentIndex: context.read<LayoutCubit>().currentIndex,
                  onTap: (index) {
                    context.read<LayoutCubit>().changeIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(AppIcons.home),
                      label: AppStrings.home,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(AppIcons.book),
                      label: AppStrings.myCourses,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(AppIcons.profile),
                      label: AppStrings.profile,
                    ),
                  ],
                  backgroundColor: AppColors.scaffoldBg,
                  selectedItemColor: AppColors.primaryPurple,
                  unselectedItemColor: AppColors.whiteColor,
                  selectedLabelStyle: AppTextStyles.styleBold16,
                  unselectedLabelStyle: AppTextStyles.styleMedium14,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

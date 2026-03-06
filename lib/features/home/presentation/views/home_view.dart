import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/features/home/data/repo/home_repo.dart';
import 'package:taalam/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:taalam/features/home/presentation/views/widgets/courses_grid_view.dart';
import 'package:taalam/features/home/presentation/views/widgets/home_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepo())..fetchCourses(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBg,
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              String currentName = '...';
              if (state is HomeSuccess) {
                currentName = state.userName;
              } else if (state is HomeFailure) {
                currentName = 'User';
              }

              return Column(
                children: [
                  HomeHeader(userName: currentName),
                  const SizedBox(height: 20),
                  const Expanded(
                    child: CoursesGridView(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
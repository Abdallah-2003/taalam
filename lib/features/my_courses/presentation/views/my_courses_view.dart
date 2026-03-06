import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/routing/routes.dart';
import 'package:taalam/features/my_courses/data/repo/my_courses_repo.dart';
import 'package:taalam/features/my_courses/presentation/cubit/my_courses_cubit/my_courses_cubit.dart';
import 'package:taalam/features/my_courses/presentation/views/widgets/my_courses_card.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCoursesCubit(MyCoursesRepo())..fetchCourses(),
      child: BlocConsumer<MyCoursesCubit, MyCoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.scaffoldBg,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text(
                AppStrings.myCourses,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            body: state is MyCoursesLoading
                ? Center(child: CircularProgressIndicator())
                : state is MyCoursesFailure
                ? Center(child: Text(state.error))
                : state is MyCoursesSuccess
                ? state.courses.isEmpty
                      ? Center(child: Text(AppStrings.noCoursesFound))
                      : ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: state.courses.length,
                          itemBuilder: (context, index) {
                            return MyCourseCard(
                              coursesModel: state.courses[index],
                              onCompleteTap: () {
                                Navigator.pushNamed(context, AppRoutes.videosView, arguments: state.courses[index].id);
                              },
                            );
                          },
                        )
                : SizedBox(),
          );
        },
      ),
    );
  }
}

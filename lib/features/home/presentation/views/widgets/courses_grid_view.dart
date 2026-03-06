import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/theme/text_styles.dart';
import 'package:taalam/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:taalam/features/home/presentation/views/widgets/course_card.dart';

class CoursesGridView extends StatelessWidget {
  const CoursesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is HomeFailure) {
          return Text(state.error);
        }
        if (state is HomeSuccess) {
          return state.courses.isEmpty
              ? Text(
                AppStrings.noCoursesFound, 
                style: AppTextStyles.style14,
              )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.62,
                    child: GridView.builder(
                      itemCount: state.courses.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 4 / 6,
                          ),
                      itemBuilder: (context, index) {
                        var course = state.courses[index];
                        return CourseCard(
                          title: course.title,
                          price: '\$${course.price}',
                          imageUrl: course.imageUrl,
                          coursesModel: course,
                        );
                      },
                    ),
                  ),
                );
        }
        return Container();
      },
    );
  }
}

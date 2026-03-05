import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/functions.dart';
import 'package:taalam/core/theme/text_styles.dart';
import 'package:taalam/features/course_details/data/repo/course_details_repo.dart';
import 'package:taalam/features/course_details/presentation/cubit/cubit/course_details_cubit.dart';
import 'package:taalam/features/course_details/presentation/views/widgets/course_details_widget.dart';
import 'package:taalam/features/home/data/model/courses_model.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key, required this.coursesModel});

  final CoursesModel coursesModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseDetailsCubit(CourseDetailsRepo()),
      child: BlocConsumer<CourseDetailsCubit, CourseDetailsState>(
        listener: (context, state) {
          if (state is CourseDetailsFailure) {
            snackBar(context: context, message: state.error, backgroundColor: AppColors.buttonBlue);
          }
          if (state is CourseDetailsSuccess) {
            snackBar(
              context: context,
              message: AppStrings.enrollSuccess,
              backgroundColor: AppColors.green,
            );
          }
        },
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
                AppStrings.courseDetails,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            body: Column(
              children: [
                CourseDetailsWidget(coursesModel: coursesModel),

                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<CourseDetailsCubit>().enrollCourse(
                            coursesModel.id,
                            Supabase.instance.client.auth.currentUser!.id,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: state is CourseDetailsLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                AppStrings.enrollCourse,
                                style: AppTextStyles.styleBold18,
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

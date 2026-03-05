import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/features/course_details/presentation/views/widgets/course_details_widget.dart';
import 'package:taalam/features/home/data/model/courses_model.dart';


class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key, required this.coursesModel});

  final CoursesModel coursesModel;

  @override
  Widget build(BuildContext context) {
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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: [
          CourseDetailsWidget(coursesModel: coursesModel),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: SizedBox(
                width: double.infinity,
                height: 56, 
                child: ElevatedButton(
                  onPressed: () {
                  
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryPurple, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    AppStrings.startCourse,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/routing/routes.dart';
import 'package:taalam/core/theme/text_styles.dart';
import 'package:taalam/features/home/data/model/courses_model.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final CoursesModel coursesModel;

  const CourseCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl, 
    required this.coursesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBg,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.whiteColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          
          Text(
            title,
            style: AppTextStyles.styleBold18,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
    
          Text(
            price,
            style: AppTextStyles.styleBold18,
          ),
          const SizedBox(height: 20),
    
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.courseDetailsView, arguments: coursesModel);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                AppStrings.showDetails,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/theme/text_styles.dart';
import 'package:taalam/features/home/data/model/courses_model.dart';

class CourseDetailsWidget extends StatelessWidget {
  const CourseDetailsWidget({super.key, required this.coursesModel});

  final CoursesModel coursesModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                coursesModel.imageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 220,
                  color: Colors.white12,
                  child: const Icon(
                    Icons.broken_image,
                    color: Colors.white54,
                    size: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            Text(
              coursesModel.title,
              style: AppTextStyles.styleNormal24,
            ),
            const SizedBox(height: 8),

            Text('\$${coursesModel.price}', style: AppTextStyles.styleSemiBold20),
            const SizedBox(height: 30),

           Text(
              AppStrings.description,
              style: AppTextStyles.styleBold18,
            ),
            const SizedBox(height: 12),

            Text(
              coursesModel.desc,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

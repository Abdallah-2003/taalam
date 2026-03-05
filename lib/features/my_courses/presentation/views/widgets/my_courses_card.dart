import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_icons.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/theme/text_styles.dart';
import 'package:taalam/features/home/data/model/courses_model.dart';

class MyCourseCard extends StatelessWidget {
  final CoursesModel coursesModel;
  final VoidCallback onCompleteTap;

  const MyCourseCard({
    super.key,
    required this.coursesModel,
    required this.onCompleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16), 
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryPurple, 
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 4),
      )]
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              coursesModel.imageUrl,
              width: 130,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 130,
                height: 90,
                color: Colors.grey[300],
                child: const Icon(AppIcons.brokenImage, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  coursesModel.title,
                  style: AppTextStyles.styleBold16.copyWith(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                
                SizedBox(
                  width: double.infinity, 
                  height: 36, 
                  child: ElevatedButton(
                    onPressed: onCompleteTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBlue, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      AppStrings.completeCourse,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
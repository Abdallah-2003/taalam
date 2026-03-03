import 'package:flutter/material.dart';
import 'package:taalam/features/home/presentation/views/widgets/course_card.dart';

class CoursesGridView extends StatelessWidget {
  const CoursesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.62,
        child: GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 4 / 6,
          ),
          itemBuilder: (context, index) {
            return CourseCard(
              title: 'Course Title',
              price: '\$99.99',
              imageUrl:
                  'https://img.freepik.com/free-photo/learning-education-ideas-insight-intelligence-study-concept_53876-120116.jpg?semt=ais_rp_progressive&w=740&q=80',
            );
          },
        ),
      ),
    );
  }
}

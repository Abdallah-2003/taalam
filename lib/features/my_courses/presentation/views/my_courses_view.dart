import 'package:flutter/material.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/features/my_courses/presentation/views/widgets/my_courses_card.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

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
          AppStrings.myCourses,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 8,
        itemBuilder: (context, index) {
          return MyCourseCard(
            title: index % 2 == 0 ? "nodejs course" : "Flutter course",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvZwc8_YE0wb11CK3k1kO2Deh7ignAus8mQQ&s",
            onCompleteTap: () {},
          );
        },
      ),
    );
  }
}

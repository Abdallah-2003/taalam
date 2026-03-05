import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taalam/features/home/data/model/courses_model.dart';

class MyCoursesRepo {
  final supabase = Supabase.instance.client;

  Future<Either<String, List<CoursesModel>>> fetchCourses() async {
    try {
      final res = await supabase
          .from('enrollment')
          .select('courses(*)')
          .eq('user_id', supabase.auth.currentUser!.id);

      List<CoursesModel> courses = [];
      for (var course in res) {
        courses.add(CoursesModel.fromJson(course));
      }
      return right(courses);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}

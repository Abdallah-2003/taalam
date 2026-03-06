import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taalam/features/home/data/model/courses_model.dart';

class HomeRepo {
  List<CoursesModel> courses = [];

  Future<Either<String, List<CoursesModel>>> getCourses() async {
    try {
      final res = await Supabase.instance.client.from('courses').select();

      courses = [];

      for (var course in res) {
        courses.add(CoursesModel.fromJson(course));
      }
      return right(courses);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> fetchUserName() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser!.id;
      final response = await Supabase.instance.client
          .from('users') 
          .select('name')
          .eq('id', userId)
          .single();

      return right(response['name'] as String);
    } catch (e) {
      return left(e.toString());
    }
  }
}

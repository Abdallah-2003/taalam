import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetailsRepo {
  final supabase = Supabase.instance.client;

  Future<Either<String, void>> enrollCourse(courseId, userId) async {
    try {
      await supabase.from('enrollment').insert({
        'course_id': courseId,
        'user_id': userId,
      });
      return right(null);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}

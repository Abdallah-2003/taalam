
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/features/home/data/model/courses_model.dart';
import 'package:taalam/features/my_courses/data/repo/my_courses_repo.dart';

part 'my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  final MyCoursesRepo myCoursesRepo;
  MyCoursesCubit(this.myCoursesRepo) : super(MyCoursesInitial());

  Future<void> fetchCourses() async {
    emit(MyCoursesLoading());
    final result = await myCoursesRepo.fetchCourses();
    result.fold(
      (error) => emit(MyCoursesFailure(error)),
      (courses) => emit(MyCoursesSuccess(courses)),
    );
  }
}

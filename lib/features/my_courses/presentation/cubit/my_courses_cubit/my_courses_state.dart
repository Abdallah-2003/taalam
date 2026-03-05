part of 'my_courses_cubit.dart';

sealed class MyCoursesState {}

final class MyCoursesInitial extends MyCoursesState {}

final class MyCoursesLoading extends MyCoursesState {}

final class MyCoursesFailure extends MyCoursesState {
  final String error;

  MyCoursesFailure(this.error);
}

final class MyCoursesSuccess extends MyCoursesState {
  final List<CoursesModel> courses;

  MyCoursesSuccess(this.courses);
}

part of 'course_details_cubit.dart';

sealed class CourseDetailsState {}

final class CourseDetailsInitial extends CourseDetailsState {}

final class CourseDetailsLoading extends CourseDetailsState {}

final class CourseDetailsFailure extends CourseDetailsState {
  final String error;

  CourseDetailsFailure(this.error);
} 

final class CourseDetailsSuccess extends CourseDetailsState {}


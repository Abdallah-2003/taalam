part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeSuccess extends HomeState {
  final List<CoursesModel> courses;
  final String userName;

  HomeSuccess(this.courses, this.userName);
}
final class HomeFailure extends HomeState {
  final String error;

  HomeFailure(this.error);
}

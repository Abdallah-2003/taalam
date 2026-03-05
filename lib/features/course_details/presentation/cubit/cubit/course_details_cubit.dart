import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/features/course_details/data/repo/course_details_repo.dart';

part 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  final CourseDetailsRepo courseDetailsRepo;
  CourseDetailsCubit(this.courseDetailsRepo) : super(CourseDetailsInitial());

  Future<void> enrollCourse(courseId, userId) async {
    emit(CourseDetailsLoading());
    final result = await courseDetailsRepo.enrollCourse(courseId, userId);
    result.fold(
      (error) => emit(CourseDetailsFailure(error)),
      (message) => emit(CourseDetailsSuccess()),
    );
  }

  Future<void> isEnrolled(courseId, userId) async {
    emit(CourseDetailsLoading());
    final result = await courseDetailsRepo.isEnrolled(courseId, userId);
    result.fold(
      (error) => emit(CourseDetailsFailure(error)),
      (isEnrolled) {
        if (isEnrolled) {
          emit(CourseDetailsEnrolled());
        } else {
          emit(CourseDetailsNotEnrolled());
        }
      },
    );
  }

}

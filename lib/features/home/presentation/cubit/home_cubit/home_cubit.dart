import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/features/home/data/model/courses_model.dart';
import 'package:taalam/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> fetchCourses() async {
    emit(HomeLoading());
    final res = await homeRepo.getCourses();
    final userResult = await homeRepo.fetchUserName();

    res.fold((error) => emit(HomeFailure(error)), (courses) {
      String finalName = 'User';
      userResult.fold(
        (nameError) => print('Failed to fetch name: $nameError'),
        (fetchedName) => finalName = fetchedName,
      );

      emit(HomeSuccess(courses, finalName));
    });
  }
}

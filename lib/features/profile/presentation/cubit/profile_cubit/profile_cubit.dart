import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/features/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    final result = await profileRepo.fetchUserProfile();
    
    result.fold(
      (error) => emit(ProfileFailure(error)),
      (data) => emit(ProfileSuccess(name: data['name']!, email: data['email']!)),
    );
  }

  Future<void> logout() async {
    await profileRepo.signOut();
    emit(ProfileLoggedOut());
  }
}
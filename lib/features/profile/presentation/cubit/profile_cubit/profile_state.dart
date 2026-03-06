part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileFailure extends ProfileState {
  final String error;
  ProfileFailure(this.error);
}
final class ProfileSuccess extends ProfileState {
  final String name;
  final String email;
  ProfileSuccess({required this.name, required this.email});
}
final class ProfileLoggedOut extends ProfileState {}
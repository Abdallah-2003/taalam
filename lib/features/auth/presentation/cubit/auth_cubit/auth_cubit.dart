import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final result = await authRepo.signIn(email: email, password: password);
    result.fold(
      (failure) => emit(SignInFailure(failure)),
      (_) => emit(SignInSuccess()),
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(SignUpLoading());
    final result = await authRepo.signUp(email: email, password: password, username: username);
    result.fold(
      (failure) => emit(SignUpFailure(failure)),
      (_) => emit(SignUpSuccess()),
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taalam/core/constant/app_strings.dart';

class AuthRepo {
  SupabaseClient client = Supabase.instance.client;

  Future<Either<String, void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await client.auth.signInWithPassword(email: email, password: password);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AppStrings.signInFailure);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await client.auth.signUp(email: email, password: password);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AppStrings.signUpFailure);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
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
    required String username, 
  }) async {
    try {
      await client.auth.signUp(email: email, password: password);
      await saveUserData(username: username, email: email);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AppStrings.signUpFailure);
    } catch (e) {
      return Left(e.toString());
    }
  }


  Future<Either<String, void>> saveUserData({
    required String username,
    required String email,
  }) async {
    try {
      await client.from('users').insert({
        'id': Supabase.instance.client.auth.currentUser!.id,
        'name': username,
        'email': email,
      });
      return right(null);
    } on AuthException catch(e) {
      return  left(e.toString());
    } catch(e) {
      return left(e.toString());
    }
  }
}
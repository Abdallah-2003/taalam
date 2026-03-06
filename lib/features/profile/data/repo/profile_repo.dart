import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepo {
  final supabase = Supabase.instance.client;

  Future<Either<String, Map<String, String>>> fetchUserProfile() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) return left("User not found");

      final response = await supabase
          .from('users')
          .select('name')
          .eq('id', user.id)
          .single();

      return right({
        'name': response['name'] as String,
        'email': user.email ?? 'No email',
      });
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
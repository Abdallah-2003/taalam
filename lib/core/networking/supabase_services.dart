import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taalam/core/networking/api_constants.dart';

class SupabaseServices {

  static init() async {

    await Supabase.initialize(
      url: ApiConstants.url,
      anonKey: ApiConstants.apiKay,
    );
  }
}
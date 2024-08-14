import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDbService {
  static SupabaseDbService? _instance;
  static SupabaseDbService get instance {
    _instance ??= SupabaseDbService._init();
    return _instance!;
  }

  SupabaseDbService._init();

  final supabase = Supabase.instance.client;

  // create document

  Future<void> createDocument(String table, Object value) {
    return supabase.from('users').insert(value).select();
  }

  // get document

  Future<List<Map<String, dynamic>>> getDocument(String table) async {
    List<Map<String, dynamic>> response = await supabase.from(table).select();

    return response;
  }
}

import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDbService {
  static SupabaseDbService? _instance;
  static SupabaseDbService get instance {
    _instance ??= SupabaseDbService._init();
    return _instance!;
  }

  SupabaseDbService._init();

  final supabase = Supabase.instance.client;

  Future<void> signInAnon() async {
    final response = await supabase.auth.signInAnonymously();

    final userId = response.user?.id;

    if (userId != null) {
      log('Anonim Kullanıcı ID: $userId');
    } else {
      log('Anonim kullanıcı oturumu açılmadı.');
    }
  }

  Future<void> createUser(String name) async {
    final response = await supabase.from('users').insert({
      "id": supabase.auth.currentUser?.id,
      'name': name,
    }).select();
    log("Response: $response");
  }

  bool checkUser() {
    log("User: ${supabase.auth.currentUser?.id}");
    return supabase.auth.currentUser != null;
  }

  Future<String> getMyUserName() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser?.id;

    final response = await supabase.from('users').select('name').eq('id', userId!).single();

    return response["name"];
  }
}

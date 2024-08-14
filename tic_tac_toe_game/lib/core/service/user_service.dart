import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

abstract class IUserService {
  final SupabaseClient supabase;

  IUserService({required this.supabase});

  Future<void> signInAnon();
  Future<bool> createUser(String name);
  bool checkUser();
  Future<String> getMyUserName();
}

final class UserService extends IUserService {
  UserService({required super.supabase});

  @override
  Future<void> signInAnon() async {
    final response = await supabase.auth.signInAnonymously();

    final userId = response.user?.id;

    if (userId != null) {
      log('Anonim Kullanıcı ID: $userId');
    } else {
      log('Anonim kullanıcı oturumu açılmadı.');
    }
  }

  @override
  Future<bool> createUser(String name) async {
    final response = await supabase.from('users').insert({
      "id": supabase.auth.currentUser?.id,
      'name': name,
    }).select();

    return response.isNotEmpty;
  }

  @override
  bool checkUser() {
    log("User: ${supabase.auth.currentUser?.id}");
    return supabase.auth.currentUser != null;
  }

  @override
  Future<String> getMyUserName() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser?.id;

    final response = await supabase.from('users').select('name').eq('id', userId!).single();

    return response["name"];
  }
}

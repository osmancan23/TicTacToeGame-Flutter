import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_toe_game/core/model/game_model.dart';

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

  Future<void> createGame(
      {required String name,
      required int color,
      required String xPlayer,
      required String oPLayer,
      required String createPlayerUId}) async {
    final response = await supabase.from('games').insert({
      "name": name,
      "color": color,
      "x_player": xPlayer,
      "o_player": oPLayer,
      "create_player_uid": createPlayerUId,
      "is_complete": false,
    }).select();
    log("Response: $response");
  }

  //get games with uid
  Future<List<GameModel>> getGames() async {
    List<Map<String, dynamic>> response =
        await supabase.from('games').select().eq('create_player_uid', supabase.auth.currentUser!.id);

    return response.map((e) => GameModel.fromJson(e)).toList();
  }

  //update game is_complete true with game id
  Future<void> updateGameIsComplete({required int gameId}) async {
    final response = await supabase.from('games').update({'is_complete': true}).eq('id', gameId);
    log("Response: $response");
  }
}

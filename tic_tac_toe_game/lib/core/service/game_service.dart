import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/game_model.dart';

abstract class IGameService {
  final SupabaseClient supabase;

  IGameService({required this.supabase});

  Future<void> createGame(
      {required String name,
      required int color,
      required String xPlayer,
      required String oPLayer,
      required String createPlayerUId});

  Future<List<GameModel>> getGames();

  Future<void> updateGameIsComplete({required int gameId});
}

class GameService extends IGameService {
  GameService({required super.supabase});

  @override
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
  @override
  Future<List<GameModel>> getGames() async {
    List<Map<String, dynamic>> response =
        await supabase.from('games').select().eq('create_player_uid', supabase.auth.currentUser!.id);

    return response.map((e) => GameModel.fromJson(e)).toList();
  }

  //update game is_complete true with game id
  @override
  Future<void> updateGameIsComplete({required int gameId}) async {
    final response = await supabase.from('games').update({'is_complete': true}).eq('id', gameId);
    log("Response: $response");
  }
}

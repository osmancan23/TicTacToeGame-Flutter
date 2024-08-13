import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/core/constants/enums/asssets_enum.dart';
import 'package:tic_tac_toe_game/core/extensions/num_extensions.dart';
import 'package:tic_tac_toe_game/core/init/navigation/navigation_service.dart';
import 'package:tic_tac_toe_game/core/service/supabase_service.dart';
import 'package:tic_tac_toe_game/feature/game/game_view.dart';
import 'package:tic_tac_toe_game/feature/gameCreate/game_create_view.dart';

import '../../core/model/game_model.dart';
part 'widget/game_item_widget.dart';

class ListOfGameView extends StatefulWidget {
  const ListOfGameView({super.key});

  @override
  State<ListOfGameView> createState() => _ListOfGameViewState();
}

class _ListOfGameViewState extends State<ListOfGameView> {
  bool isLoading = false;
  List<GameModel> games = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            100.ph,
            ElevatedButton(
              onPressed: () async => await NavigationService.instance.navigateToPage(context, const GameCreateView()),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
              ),
              child: const Text("Create Game"),
            ),
            FutureBuilder(
              future: SupabaseDbService.instance.getGames(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      GameModel game = snapshot.data[index];
                      return GestureDetector(
                        onTap: () => NavigationService.instance.navigateToPage(context,
                            const GameView(gameId: "gameId", playerId: "playerId", backgroundColor: Colors.red)),
                        child: _GameItemWidget(gameModel: game),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}

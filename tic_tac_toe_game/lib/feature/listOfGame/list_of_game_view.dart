import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/core/constants/enums/asssets_enum.dart';
import 'package:tic_tac_toe_game/core/extensions/num_extensions.dart';
import 'package:tic_tac_toe_game/core/init/navigation/navigation_service.dart';
import 'package:tic_tac_toe_game/feature/game/game_view.dart';
import 'package:tic_tac_toe_game/feature/gameCreate/game_create_view.dart';
part 'widget/game_item_widget.dart';

class ListOfGameView extends StatelessWidget {
  const ListOfGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
          20.ph,
          GestureDetector(
            onTap: () => NavigationService.instance.navigateToPage(
                context, const GameView(gameId: "gameId", playerId: "playerId", backgroundColor: Colors.red)),
            child: const _GameItemWidget(
                gameName: "gameName",
                playerX: "playerX",
                playerO: "playerO",
                isCompleted: true,
                backgroundColor: Colors.black),
          )
        ],
      ),
    ));
  }
}

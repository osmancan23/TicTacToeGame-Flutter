import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_toe_game/core/constants/enums/game_value_enum.dart';
import 'package:tic_tac_toe_game/core/extensions/int_extensions.dart';
import 'package:tic_tac_toe_game/core/extensions/num_extensions.dart';
import 'package:tic_tac_toe_game/core/model/game_model.dart';
import 'package:tic_tac_toe_game/core/service/game_service.dart';
part 'widget/tap_item_widget.dart';
part "mixin/game_view_mixin.dart";
part "widget/user_container_widget.dart";

class GameView extends StatefulWidget {
  final GameModel gameModel;

  const GameView({super.key, required this.gameModel});

  @override
  // ignore: library_private_types_in_public_api
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> with _GameMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.gameModel.color?.toColor,
      appBar: AppBar(title: Text("Game Name: ${widget.gameModel.name ?? "-"}")),
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          40.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _UserContainerWidget(
                name: widget.gameModel.xPlayer ?? "-",
                type: GameValueEnum.x,
              ),
              _UserContainerWidget(
                name: widget.gameModel.oPlayer ?? "-",
                type: GameValueEnum.o,
              ),
            ],
          ),
          if (winnerUser != '')
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                winnerUser == 'Draw' ? 'It\'s a Draw!' : '$winnerUser Wins!',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          50.ph,
          Padding(
            padding: const EdgeInsets.all(32),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: widget.gameModel.color!.toColor, width: 4.0),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return _TapItemWidget(
                    value: board[index],
                    onTap: () => _handleTap(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

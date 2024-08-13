import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tic_tac_toe_game/core/constants/enums/asssets_enum.dart';
import 'package:tic_tac_toe_game/core/extensions/num_extensions.dart';
part 'widget/tap_item_widget.dart';
part "mixin/game_view_mixin.dart";

enum ValueEnum {
  x(icon: AsssetsEnum.man, value: "X", color: Colors.blue),
  o(icon: AsssetsEnum.woman, value: "O", color: Colors.red);

  final String value;
  final AsssetsEnum icon;
  final Color color;
  const ValueEnum({required this.value, required this.icon, required this.color});
}

class GameView extends StatefulWidget {
  final String gameId; // Oyun ID'si
  final String playerId; // Oynayan oyuncunun ID'si
  final Color backgroundColor; // Oyun arka plan rengi

  const GameView({super.key, required this.gameId, required this.playerId, required this.backgroundColor});

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> with _GameMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: AppBar(title: const Text('Tic Tac Toe')),
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          20.ph,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _UserContainerWidget(name: "Osmancan", type: ValueEnum.x),
              _UserContainerWidget(name: "Suat", type: ValueEnum.o),
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
          Padding(
            padding: const EdgeInsets.all(32),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: widget.backgroundColor, width: 4.0),
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
          //    16.ph,
          if (winnerUser != '')
            ElevatedButton(
              onPressed: _resetGame,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                textStyle: const TextStyle(fontSize: 18.0),
              ),
              child: const Text('Play Again'),
            ),
        ],
      ),
    );
  }
}

class _UserContainerWidget extends StatelessWidget {
  const _UserContainerWidget({
    required this.name,
    required this.type,
  });
  final String name;
  final ValueEnum type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(type.icon.pngPath, width: 50, height: 50),
            Text(name),
            Text(
              type.value,
              style: TextStyle(fontSize: 30, color: type.color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

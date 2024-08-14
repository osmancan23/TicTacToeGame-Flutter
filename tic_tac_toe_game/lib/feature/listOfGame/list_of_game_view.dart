import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_toe_game/core/constants/enums/asssets_enum.dart';
import 'package:tic_tac_toe_game/core/extensions/int_extensions.dart';
import 'package:tic_tac_toe_game/core/extensions/num_extensions.dart';
import 'package:tic_tac_toe_game/core/init/navigation/navigation_service.dart';
import 'package:tic_tac_toe_game/feature/game/game_view.dart';
import 'package:tic_tac_toe_game/feature/gameCreate/game_create_view.dart';

import '../../core/model/game_model.dart';
part 'widget/game_item_widget.dart';

class ListOfGameView extends StatelessWidget {
  const ListOfGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            100.ph,
            ElevatedButton(
              onPressed: () async => await NavigationService.instance.navigateToPage(context, const GameCreateView()),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
              ),
              child: const Text("Create Game"),
            ),
            const _GameStreamListWidget(),
          ],
        ),
      ),
    ));
  }
}

class _GameStreamListWidget extends StatefulWidget {
  const _GameStreamListWidget();

  @override
  State<_GameStreamListWidget> createState() => __GameStreamListWidgetState();
}

class __GameStreamListWidgetState extends State<_GameStreamListWidget> {
  List<GameModel> games = [];
  late Stream gameStream;
  @override
  void initState() {
    super.initState();
    gameStream = Supabase.instance.client.from("games").stream(primaryKey: ["id"]);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: gameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            _handleData(snapshot);

            return ListView.builder(
              itemCount: games.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                GameModel game = games[index];
                return _GameItemWidget(gameModel: game);
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void _handleData(AsyncSnapshot<dynamic> snapshot) {
    games = snapshot.data.map((e) => GameModel.fromJson(e)).toList().cast<GameModel>();
  }
}

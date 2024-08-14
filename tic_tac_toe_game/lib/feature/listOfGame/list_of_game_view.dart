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
part "widget/game_stream_list_widget.dart";

class ListOfGameView extends StatelessWidget {
  const ListOfGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("List of Game"),
          actions: [
            IconButton(
              onPressed: () async => await NavigationService.instance.navigateToPage(context, const GameCreateView()),
              icon: const Icon(
                Icons.add_circle_outline,
                size: 30,
              ),
            ),
          ],
        ),
        body: const Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _GameStreamListWidget(),
              ],
            ),
          ),
        ));
  }
}

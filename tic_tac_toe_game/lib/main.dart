import 'package:flutter/material.dart';

import 'package:tic_tac_toe_game/core/init/app_init.dart';
import 'package:tic_tac_toe_game/feature/listOfGame/list_of_game_view.dart';

Future<void> main() async {
  await ApplicationInit.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ListOfGameView(),
    );
  }
}

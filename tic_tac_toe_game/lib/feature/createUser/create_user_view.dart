import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_toe_game/core/constants/enums/asssets_enum.dart';
import 'package:tic_tac_toe_game/core/extensions/num_extensions.dart';
import 'package:tic_tac_toe_game/core/init/navigation/navigation_service.dart';
import 'package:tic_tac_toe_game/feature/listOfGame/list_of_game_view.dart';

import '../../core/service/user_service.dart';

part "mixin/create_user_mixin.dart";

final class CreateUserView extends StatefulWidget {
  const CreateUserView({super.key});

  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> with _CreateUserMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Lottie.asset(AsssetsEnum.ticTacToe.lottiePath, height: 200),
            const Text(
              "Welcome to Tic Tac Toe Game",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            40.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Please enter your name",
                ),
              ),
            ),
            20.ph,
            ElevatedButton(
              onPressed: () async => await _createUser(context),
              child: const Text("Start Game"),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

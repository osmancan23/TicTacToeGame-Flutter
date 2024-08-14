import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tic_tac_toe_game/core/extensions/num_extensions.dart';
import 'package:tic_tac_toe_game/core/init/navigation/navigation_service.dart';
import 'package:tic_tac_toe_game/feature/listOfGame/list_of_game_view.dart';

import '../../core/service/user_service.dart';

part "mixin/create_user_mixin.dart";

class CreateUserView extends StatefulWidget {
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
            const Text("Welcome to Tic Tac Toe Game"),
            20.ph,
            const Text("Please enter your name"),
            20.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            20.ph,
            ElevatedButton(
              onPressed: () async {
                await _userService.createUser(_nameController.text).then((val) {
                  if (val) {
                    NavigationService.instance.navigateToPageReplace(context, const ListOfGameView());
                  }
                });
              },
              child: const Text("Start Game"),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/core/extensions/num_extensions.dart';

import '../../core/service/supabase_service.dart';

part 'mixin/game_create_mixin.dart';
part "widget/color_option_widget.dart";

class GameCreateView extends StatefulWidget {
  const GameCreateView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GameCreateViewState createState() => _GameCreateViewState();
}

class _GameCreateViewState extends State<GameCreateView> with _GameCreateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TextWidget(text: "Game Name"),
              8.ph,
              _TextFieldWidget(controller: _gameNameController, hintText: "Enter game name"),
              16.ph,
              const _TextWidget(text: "Participants"),
              8.ph,
              _TextFieldWidget(controller: _playerXController, readOnly: true, hintText: "Enter game name"),
              8.ph,
              _TextFieldWidget(controller: _playerOController, hintText: "Enter O player name"),
              16.ph,
              const _TextWidget(text: "Board Background Color"),
              8.ph,
              _OnboardColorOptionListView(onSelect: (color) {}),
              32.ph,
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    textStyle: const TextStyle(fontSize: 18.0),
                  ),
                  child: const Text('Create Game'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? readOnly;
  const _TextFieldWidget({required this.controller, required this.hintText, this.readOnly});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly ?? false,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

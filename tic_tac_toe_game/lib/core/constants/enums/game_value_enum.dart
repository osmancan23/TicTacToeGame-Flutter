import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/core/constants/enums/asssets_enum.dart';

enum GameValueEnum {
  x(icon: AsssetsEnum.man, value: "X", color: Colors.blue),
  o(icon: AsssetsEnum.woman, value: "O", color: Colors.red);

  final String value;
  final AsssetsEnum icon;
  final Color color;
  const GameValueEnum({required this.value, required this.icon, required this.color});
}

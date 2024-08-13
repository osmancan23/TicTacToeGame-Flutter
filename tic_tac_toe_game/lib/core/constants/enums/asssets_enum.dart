import 'package:tic_tac_toe_game/core/extensions/string_extensions.dart';

enum AsssetsEnum {
  ticTacToe("ticTacToe");

  final String iconName;

  const AsssetsEnum(this.iconName);

  String get pngPath => iconName.toPng;
}

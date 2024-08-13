import 'package:tic_tac_toe_game/core/extensions/string_extensions.dart';

enum AsssetsEnum {
  man("man"),
  ticTacToe("ticTacToe"),
  woman("woman");

  final String iconName;

  const AsssetsEnum(this.iconName);

  String get pngPath => iconName.toPng;
}

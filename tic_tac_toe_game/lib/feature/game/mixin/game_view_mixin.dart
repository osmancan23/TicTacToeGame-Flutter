part of '../game_view.dart';

mixin _GameMixin on State<GameView> {
  List<String> board = List.filled(9, '');
  bool isXTurn = true;
  String winnerUser = '';
  late IGameService _gameService;

  @override
  void initState() {
    super.initState();
    _gameService = GameService(supabase: Supabase.instance.client);
  }

  void _handleTap(int index) {
    if (board[index] == '' && winnerUser == '') {
      setState(() {
        board[index] = isXTurn ? 'X' : 'O';
        isXTurn = !isXTurn;
        _checkWinner();
      });
    }
  }

  Future<void> _checkWinner() async {
    const List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      final String first = board[pattern[0]];
      if (first != '' && first == board[pattern[1]] && first == board[pattern[2]]) {
        setState(() {
          winnerUser = first;
        });
        await _gameService.updateGameIsComplete(gameId: widget.gameModel.id!);
        return;
      }
    }

    if (!board.contains('')) {
      _resetGame();
    }
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
      isXTurn = true;
      winnerUser = '';
    });
  }
}

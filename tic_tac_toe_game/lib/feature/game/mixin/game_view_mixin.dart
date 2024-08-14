part of '../game_view.dart';

mixin _GameMixin on State<GameView> {
  late List<String> board;
  late int rows;
  late int columns;
  bool isXTurn = true;
  String winnerUser = '';
  late IGameService _gameService;

  @override
  void initState() {
    super.initState();
    rows = widget.gameModel.row ?? 3;
    columns = widget.gameModel.column ?? 3;
    board = List.filled(rows * columns, '');
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
    final List<List<int>> winPatterns = _generateWinPatterns();

    for (var pattern in winPatterns) {
      final String first = board[pattern[0]];
      if (first != '' && pattern.every((index) => board[index] == first)) {
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

  List<List<int>> _generateWinPatterns() {
    final List<List<int>> winPatterns = [];

    // Yatay kazanma ihtimalleri
    for (int i = 0; i < rows; i++) {
      List<int> pattern = [];
      for (int j = 0; j < columns; j++) {
        pattern.add(i * columns + j);
      }
      winPatterns.add(pattern);
    }

    // Dikey kazanma ihtimalleri
    for (int i = 0; i < columns; i++) {
      List<int> pattern = [];
      for (int j = 0; j < rows; j++) {
        pattern.add(j * columns + i);
      }
      winPatterns.add(pattern);
    }

    // Çapraz kazanma ihtimalleri (sol üstten sağ alta)
    if (rows == columns) {
      List<int> diagonal1 = [];
      for (int i = 0; i < rows; i++) {
        diagonal1.add(i * columns + i);
      }
      winPatterns.add(diagonal1);

      // Çapraz kazanma ihtimalleri (sağ üstten sol alta)
      List<int> diagonal2 = [];
      for (int i = 0; i < rows; i++) {
        diagonal2.add(i * columns + (columns - 1 - i));
      }
      winPatterns.add(diagonal2);
    }

    return winPatterns;
  }

  void _resetGame() {
    setState(() {
      board = List.filled(rows * columns, '');
      isXTurn = true;
      winnerUser = '';
    });
  }
}

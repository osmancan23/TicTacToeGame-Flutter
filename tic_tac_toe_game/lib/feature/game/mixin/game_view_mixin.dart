part of '../game_view.dart';

mixin _GameMixin on State<GameView> {
  List<String> board = List.filled(9, ''); // 3x3 grid
  bool isXTurn = true; // X oyuncusunun sırası
  String winnerUser = '';

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
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Yatay kazanma ihtimalleri
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Dikey kazanma ihtimalleri
      [0, 4, 8], [2, 4, 6], // Çapraz kazanma ihtimalleri
    ];

    for (var pattern in winPatterns) {
      final String first = board[pattern[0]];
      if (first != '' && first == board[pattern[1]] && first == board[pattern[2]]) {
        setState(() {
          winnerUser = first;
        });
        await SupabaseDbService.instance.updateGameIsComplete(gameId: widget.gameModel.id!).then((_) async {
          NavigationService.instance.navigateBack(context);
          return;
        });
      }
    }

    // Eğer tüm hücreler dolu ve kazanan yoksa oyun berabere.
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

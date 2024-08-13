part of "../list_of_game_view.dart";

class _GameItemWidget extends StatelessWidget {
  final String gameName;
  final String playerX;
  final String playerO;
  final bool isCompleted;
  final Color backgroundColor;

  const _GameItemWidget({
    required this.gameName,
    required this.playerX,
    required this.playerO,
    required this.isCompleted,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: backgroundColor, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AsssetsEnum.ticTacToe.pngPath, width: 100.0, height: 100.0),
              16.pw,
              _buildGameContentWidget()
            ],
          ),
          8.ph,
          _buildProgressWidget(),
        ],
      ),
    );
  }

  Column _buildGameContentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          gameName,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: backgroundColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'X: $playerX',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
            Text(
              'O: $playerO',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row _buildProgressWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Chip(
            label: Text(
              isCompleted ? 'Completed' : 'In Progress',
              style: TextStyle(
                color: isCompleted ? Colors.green : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: isCompleted ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}

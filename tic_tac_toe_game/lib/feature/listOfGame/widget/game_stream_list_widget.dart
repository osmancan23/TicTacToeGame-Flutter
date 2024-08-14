part of '../list_of_game_view.dart';
class _GameStreamListWidget extends StatefulWidget {
  const _GameStreamListWidget();

  @override
  State<_GameStreamListWidget> createState() => __GameStreamListWidgetState();
}

class __GameStreamListWidgetState extends State<_GameStreamListWidget> {
  List<GameModel> games = [];
  late Stream gameStream;
  @override
  void initState() {
    super.initState();
    gameStream = Supabase.instance.client.from("games").stream(primaryKey: ["id"]);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: gameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            _handleData(snapshot);

            return ListView.builder(
              itemCount: games.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                GameModel game = games[index];
                return _GameItemWidget(gameModel: game);
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void _handleData(AsyncSnapshot<dynamic> snapshot) {
    games = snapshot.data.map((e) => GameModel.fromJson(e)).toList().cast<GameModel>();
  }
}

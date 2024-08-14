part of '../list_of_game_view.dart';

class _GameStreamListWidget extends StatefulWidget {
  const _GameStreamListWidget();

  @override
  State<_GameStreamListWidget> createState() => __GameStreamListWidgetState();
}

class __GameStreamListWidgetState extends State<_GameStreamListWidget> {
  List<GameModel> games = [];
  late StreamSubscription streamSubscription;
  @override
  void initState() {
    super.initState();
    streamSubscription =
        Supabase.instance.client.from('games').stream(primaryKey: ['id']).listen((List<dynamic> games) {
      String userId = Supabase.instance.client.auth.currentUser!.id;
      final filteredGames = games.where((game) => game['create_player_uid'] == userId).toList();
      this.games.clear();
      for (var element in filteredGames) {
        this.games.add(GameModel.fromJson(element));
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await streamSubscription.cancel();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: games.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        GameModel game = games[index];
        return _GameItemWidget(gameModel: game);
      },
    );
  }
}

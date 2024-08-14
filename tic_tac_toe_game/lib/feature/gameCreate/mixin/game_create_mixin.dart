part of "../game_create_view.dart";

mixin _GameCreateMixin on State<GameCreateView> {
  final TextEditingController _gameNameController = TextEditingController();
  final TextEditingController _playerXController = TextEditingController();
  final TextEditingController _playerOController = TextEditingController();
  Color? _selectedColor;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _playerXController.text = await SupabaseDbService.instance.getMyUserName();
    });
  }

  Future<void> _createGame(BuildContext context) async {
    try {
      await SupabaseDbService.instance
          .createGame(
              name: _gameNameController.text,
              color: _selectedColor!.value,
              xPlayer: _playerXController.text,
              oPLayer: _playerOController.text,
              createPlayerUId: SupabaseDbService.instance.supabase.auth.currentUser!.id)
          .then((_) {
        NavigationService.instance.navigateBack(context);
      });
    } catch (e) {
      log("Error: $e");
    }
  }
}

part of "../game_create_view.dart";

mixin _GameCreateMixin on State<GameCreateView> {
  final TextEditingController _gameNameController = TextEditingController();
  final TextEditingController _playerXController = TextEditingController();
  final TextEditingController _playerOController = TextEditingController();
  Color? _selectedColor;
  late IGameService _gameService;
  late IUserService _userService;
  late SupabaseClient _supabaseClient;
  @override
  void initState() {
    super.initState();
    _supabaseClient = Supabase.instance.client;
    _gameService = GameService(supabase: _supabaseClient);
    _userService = UserService(supabase: _supabaseClient);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _playerXController.text = await _userService.getMyUserName();
    });
  }

  Future<void> _createGame(BuildContext context) async {
    try {
      await _gameService
          .createGame(
              name: _gameNameController.text,
              color: _selectedColor!.value,
              xPlayer: _playerXController.text,
              oPLayer: _playerOController.text,
              createPlayerUId: _supabaseClient.auth.currentUser!.id)
          .then((_) {
        NavigationService.instance.navigateBack(context);
      });
    } catch (e) {
      log("Error: $e");
    }
  }
}

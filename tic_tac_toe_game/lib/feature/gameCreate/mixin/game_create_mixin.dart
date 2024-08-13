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
}

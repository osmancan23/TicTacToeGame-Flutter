part of "../create_user_view.dart";

mixin _CreateUserMixin on State<CreateUserView> {
  final TextEditingController _nameController = TextEditingController();
  late IUserService _userService;
  @override
  void initState() {
    super.initState();
    _userService = UserService(supabase: Supabase.instance.client);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_userService.checkUser()) {
        await NavigationService.instance.navigateToPage(context, const ListOfGameView());
      }
    });
  }

  Future<void> _createUser(BuildContext context) async {
    await _userService.signInAnon();
    await _userService.createUser(_nameController.text).then((val) {
      if (val) {
        NavigationService.instance.navigateToPageReplace(context, const ListOfGameView());
      }
    });
  }
}

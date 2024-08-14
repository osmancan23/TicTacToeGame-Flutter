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
}

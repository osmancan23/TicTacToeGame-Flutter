part of "../create_user_view.dart";

mixin _CreateUserMixin on State<CreateUserView> {
  final TextEditingController _nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (SupabaseDbService.instance.checkUser()) {
        await NavigationService.instance.navigateToPage(context, const ListOfGameView());
      } else {
        await SupabaseDbService.instance.signInAnon();
      }
    });
  }
}

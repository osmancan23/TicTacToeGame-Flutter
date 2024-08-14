import 'package:flutter/material.dart';

class NavigationService {
  static NavigationService? _instance;
  static NavigationService get instance {
    _instance ??= NavigationService._init();
    return _instance!;
  }

  NavigationService._init();

  //push
  Future<void> navigateToPage(BuildContext context, Widget page) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  //pop
  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  //replace
  Future<void> navigateToPageReplace(BuildContext context, Widget page) async {
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants/app_constants.dart';

class ApplicationInit {
  static ApplicationInit? _instance;
  static ApplicationInit get instance {
    _instance ??= ApplicationInit._init();
    return _instance!;
  }

  ApplicationInit._init();

  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Supabase.initialize(
      url: AppConstants.instance.supabaseUrl,
      anonKey: AppConstants.instance.supabaseAnonKey,
    );
  }
}

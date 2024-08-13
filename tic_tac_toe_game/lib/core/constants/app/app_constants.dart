class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  final String supabaseUrl = "https://aluesgdmzgbuazqgiano.supabase.co";
  final String supabaseAnonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsdWVzZ2RtemdidWF6cWdpYW5vIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM1Mzg0MjEsImV4cCI6MjAzOTExNDQyMX0.sKKzwmtYK7Xf-K-3JkM8OXpJW0RwCV3E9i2QEpMgK5w";
}

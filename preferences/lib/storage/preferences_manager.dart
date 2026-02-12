import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static const savedTextKey = "saved_text";

  Future<SharedPreferences> getInstance() async {
    return SharedPreferences.getInstance();
  }

  void saveText(String text) async {
    final prefs = await getInstance();
    prefs.setString(savedTextKey, text);
  }

  Future<String?> readText() async {
    final prefs = await getInstance();
    return prefs.getString(savedTextKey);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static const savedTextKey = "saved_text";

  void saveText(String text) async {
    final prefs = await getInstance();
    await prefs.setString(savedTextKey, text);
  }

  Future<String> getSavedText() async {
    final prefs = await getInstance();
    return prefs.getString(savedTextKey) ?? "";
  }

  Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }
}

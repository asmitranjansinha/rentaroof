import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  late SharedPreferences prefs;

  void setString(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  void setBool(String key, bool value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  Future<bool> containsKey(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future<bool> remove(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  Future<bool> setStringList(String key, List<String> list) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(key, list);
  }

  Future<List<String>> getStringList(String key) async {
    prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(key) ?? <String>[]);
  }
}

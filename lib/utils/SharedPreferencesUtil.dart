import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesUtil{
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static void saveString(String key,String value,Function callBack) async  {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value).then(callBack);
  }

  static Future<String> getString(String key) async  {
    final SharedPreferences prefs = await _prefs;
     String s = prefs.getString(key);
    return s;
  }
  static Future<bool> clearAll() async  {
    final SharedPreferences prefs = await _prefs;
    bool s = await prefs.clear();
    return s;
  }

}
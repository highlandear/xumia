import 'package:shared_preferences/shared_preferences.dart';
class AStorage{

  static save<T>(String key, T value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (T) {
      case String:
        prefs.setString(key, value as String);
        break;
      case int:
        prefs.setInt(key, value as int);
        break;
      case bool:
        prefs.setBool(key, value as bool);
        break;
      case double:
        prefs.setDouble(key, value as double);
        break;
      default:
        break;
    }
  }

  static Future setv(String key, String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future getv(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString(key);
  }

  static Future get<T>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (T) {
      case String:
        return prefs.getString(key) as T;
      case int:
        return  prefs.getInt(key) as T;
      case bool:
        return prefs.getBool(key) as T;
      case double:
        return prefs.getDouble(key) as T;
      default:
        return null;
    }
  }
}
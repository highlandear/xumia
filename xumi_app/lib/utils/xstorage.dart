import 'package:shared_preferences/shared_preferences.dart';

class XStorage {
  static save(String key, String value) async{
    (await SharedPreferences.getInstance()).setString(key, value);
  }

  static Future get(String key) async {
    return (await SharedPreferences.getInstance()).get(key);
  }

  static remove(String key) async{
    return (await SharedPreferences.getInstance()).remove(key);
  }
}


import 'package:shared_preferences/shared_preferences.dart';
//TODO
class SharedPreferencesHelper {
  static SharedPreferences? sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
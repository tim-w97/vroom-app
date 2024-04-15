
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_campus_app/userdefaults/keys.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<SharedPreferences> getInstance() async {
     if(_sharedPreferences == null) {
       return SharedPreferences.getInstance();
     }
     return _sharedPreferences!;
  }

  //User login
  static void setSaveUserLoginData(bool state) async {
     _sharedPreferences!.setBool(
         SharedPreferencesKeys.saveUserLoginBool.toString(), state
     );
  }

  static bool getSaveUserLoginData(){
     return _sharedPreferences!.getBool(
         SharedPreferencesKeys.saveUserLoginBool.toString()
     ) ?? false;
  }

  //Base64String
  static void setBase64Authentication(String base64String) async {
     _sharedPreferences!.setString(
         SharedPreferencesKeys.base64Authentication.toString(), base64String
     );
  }

  static String getBase64Authentication() {
     return _sharedPreferences!.getString(
         SharedPreferencesKeys.base64Authentication.toString()
     ) ?? "";
  }


}

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vroom_campus_app/userdefaults/keys.dart';

class SharedPreferencesHelper {
  static SharedPreferences? sharedPreferences;

  //TODO Init at the start of the app
   static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //User login
  static void setSaveUserLoginData(bool state) async {
     sharedPreferences!.setBool(
         SharedPreferencesKeys.saveUserLoginBool.toString(), state
     );
  }

  static bool getSaveUserLoginData(){
     return sharedPreferences!.getBool(
         SharedPreferencesKeys.saveUserLoginBool.toString()
     ) ?? false;
  }

  //Base64String

  static void setBase64Authentication(String base64String) async {
     sharedPreferences!.setString(
         SharedPreferencesKeys.base64Authentication.toString(), base64String
     );
  }

  static String getBase64Authentication() {
     return sharedPreferences!.getString(
         SharedPreferencesKeys.base64Authentication.toString()
     ) ?? "";
  }


}
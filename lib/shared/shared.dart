import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo/Models/user.dart';

class SharedPrefData {
  static Future<SharedPreferences> get _instance async =>
      sharedPreference ??= await SharedPreferences.getInstance();
  static SharedPreferences? sharedPreference;

  //INITILIZING SHARED PREFERENCE
  static Future<SharedPreferences?> init() async {
    sharedPreference = await _instance;
    return sharedPreference;
  }

  //GETTING USER DETAILS
  static UserModel? getUserDetails() {
    if (sharedPreference == null) return null;
    if (sharedPreference!.getString(userDetailKey) == null) return null;
    var data = jsonDecode(sharedPreference!.getString(userDetailKey) ?? "");
    // ignore: avoid_print
    print("shared data is$data");
    return data != "" ? UserModel.fromJson(data) : null;
  }

  //SETTING USER DETAILS
  static setUserDetails(UserModel userModel) {
    sharedPreference!
        .setString(userDetailKey, jsonEncode(userModel.toJson()).toString());
  }
}

const String userDetailKey = "userDetailsKey";

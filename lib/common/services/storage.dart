import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/constant.dart';
import 'package:ulearning_app/pages/login/user.dart';

class StorageService {
  late SharedPreferences _pref;
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getDeviceOpenFirstTime() {
    return _pref.getBool(Constant.IS_FIRST_TIME) ?? false;
  }

  bool getUserToken() {
    String? token = _pref.getString(Constant.USER_TOKEN);
    return token != null && token.isNotEmpty;
  }

  String getString(String key) {
    return _pref.getString(key) ?? '';
  }

  UserProfile getUserProfile() {
    Map<String, dynamic> json = jsonDecode(getString(Constant.USER_PROFILE));
    return UserProfile.fromJson(json);
  }
}

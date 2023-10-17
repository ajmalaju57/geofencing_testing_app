import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/data/shared_preference/pref_keys.dart';

SharedPreferences? sharedPref;

class SharedPref {
  static Future<SharedPreferences> get _instance async =>
      sharedPref ??= await SharedPreferences.getInstance();

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    sharedPref = await _instance;
    return sharedPref!;
  }

  static Future<bool> save(
      {required String key, required dynamic value}) async {
    if (sharedPref == null) await init();
    switch (value.runtimeType) {
      case String:
        return sharedPref!.setString(key, value);
      case bool:
        return sharedPref!.setBool(key, value);
      case int:
        return sharedPref!.setInt(key, value);
      case double:
        return sharedPref!.setDouble(key, value);
      default:
        return sharedPref!.setString(key, jsonEncode(value));
    }
  }

  static Future<dynamic> getUserInfo() async {
    final String? userDataString = sharedPref?.getString(userKey);

    if (userDataString == null) {
      debugPrint(" SHAREF PREF false");
      return null;
    }
    return userDataString;
  }

  static clear() => sharedPref!.clear();
}

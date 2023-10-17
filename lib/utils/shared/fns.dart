import 'package:flutter/material.dart';
import 'package:test_app/data/shared_preference/shared_pref.dart';
import 'package:test_app/ui/auth/login_page/login_page.dart';
import 'package:test_app/utils/shared/page_navigator.dart';

bool isLoading = false;

void get hideKeyboard => FocusManager.instance.primaryFocus?.unfocus();

class Helper {
  static logout(BuildContext context) {
    SharedPref.clear();
    Screen.openAsNewPage(context, const LoginPage());
  }
}

// ignore_for_file: unrelated_type_equality_checks, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_app/data/shared_preference/pref_keys.dart';
import 'package:test_app/data/shared_preference/shared_pref.dart';
import 'package:test_app/ui/pages/home/home_page.dart';
import 'package:test_app/utils/shared/app_snackbar.dart';
import 'package:test_app/utils/shared/page_navigator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginInitial());
  BuildContext context;
  TextEditingController userName = TextEditingController();
  TextEditingController pass = TextEditingController();

  final String usernameValue = "admin";
  final String passValue = "1234";

  login() {
    if (usernameValue == userName.text && passValue == pass.text) {
      SharedPref.save(key: userKey, value: userName.text);
      Screen.open(context, const HomePage());
    } else if (userName.text.isEmpty || pass.text.isEmpty) {
      snackBar(context, message: "Enter Values", type: MessageType.error);
    } else {
      snackBar(context,
          message: "invalid credentials", type: MessageType.error);
    }
  }
}

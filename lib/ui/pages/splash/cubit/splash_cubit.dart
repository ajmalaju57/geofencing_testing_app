// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_app/data/shared_preference/shared_pref.dart';
import 'package:test_app/ui/auth/login_page/login_page.dart';
import 'package:test_app/ui/pages/home/home_page.dart';
import 'package:test_app/utils/shared/page_navigator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial()) {
    initPage();
  }

  final BuildContext context;

  initPage() async {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (await SharedPref.getUserInfo() == null) {
          Screen.openAsNewPage(context, const LoginPage());
          return;
        } else {
          Screen.openAsNewPage(context, const HomePage());
        }
      },
    );
  }
}

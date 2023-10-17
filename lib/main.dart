import 'package:flutter/material.dart';
import 'package:test_app/data/shared_preference/shared_pref.dart';
import 'package:test_app/ui/pages/splash/splash_page.dart';
import 'package:test_app/utils/constants.dart';
import 'package:test_app/utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const Scaffold(body: SplashPage()));
  }
}

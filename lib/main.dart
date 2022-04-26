// ignore_for_file: prefer_const_constructors

import 'package:class_manager/custom_theme.dart';
import 'package:class_manager/homepage.dart';
import 'package:class_manager/logins/loginTeacher.dart';
import 'package:class_manager/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

var screen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      screen = LoginTeacher();
    } else {
      screen = HomePage();
    }
  });
  // await Firebase.initializeApp(options:
  //  DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: CustomTheme(context).lightTheme);
  }
}

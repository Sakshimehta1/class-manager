import 'dart:async';

import 'package:class_manager/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'logins/loginTeacher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var screen;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sc();
    Timer(const Duration(milliseconds: 600), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.usersRectangle,
              color: Colors.teal.shade300,
              size: 140,
            ),
            const SizedBox(
              height: 60,
            ),
            const Text("CLASS  MANAGER").text.black.bold.xl2.make()
          ],
        ),
      ),
    );
  }

  Future<void> sc() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        screen = const LoginTeacher();
      } else {
        screen = const HomePage();
      }
    });
  }
}

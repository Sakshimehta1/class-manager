import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  BuildContext context;
  CustomTheme(this.context);
  ThemeData get lightTheme {
    return ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primaryColor: Colors.purple,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        // fontFamily: 'Montserrat', //3
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.pink,
        ));
  }
}

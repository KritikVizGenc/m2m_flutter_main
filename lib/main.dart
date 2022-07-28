import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'pages/splash_screen.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'pages/mentee_page.dart';
import 'pages/mentor_mentee_choose_page.dart';
import 'pages/registiration_page.dart';

void main() {
  runApp(LoginUIApp());
}

class LoginUIApp extends StatelessWidget {
  Color _primaryColor = HexColor('#CD5C5C');
  Color accentColor = HexColor('#FA8072');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primaryColor: _primaryColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: accentColor),
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'Flutter Login'),
    );
  }
}

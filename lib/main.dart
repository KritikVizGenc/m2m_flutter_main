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
  Color _primaryColor = Color.fromARGB(255, 205, 92, 92);
  Color accentColor = Color.fromARGB(255, 250, 128, 114);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        drawerTheme: DrawerThemeData(backgroundColor: _primaryColor),
        appBarTheme: AppBarTheme(backgroundColor: _primaryColor),
        primaryColor: Color.fromARGB(255, 205, 92, 92),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'Flutter Login'),
    );
  }
}

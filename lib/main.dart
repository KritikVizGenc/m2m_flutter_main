import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/pages/edit_profile_page.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';
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
  static Map<int, Color> color = {
    50: Color.fromARGB(255, 111, 116, 165), //10%
    100: Color.fromARGB(255, 7, 11, 47), //20%
    200: Color.fromARGB(255, 13, 20, 79), //30%
    300: Color.fromARGB(255, 22, 30, 110), //40%
    400: Color.fromARGB(255, 36, 42, 99), //50%
    500: Color.fromARGB(255, 31, 38, 99), //60%
    600: Color.fromARGB(255, 84, 88, 125), //70%
    700: Color.fromARGB(255, 48, 54, 106), //80%
    800: Color.fromARGB(255, 94, 62, 92), //90%
    900: Color.fromARGB(255, 62, 35, 60), //100%
  };
  Color _primaryColor = Color.fromARGB(255, 69, 41, 67);
  Color accentColor = Color.fromARGB(255, 29, 33, 63);
  Color backColor = Color.fromARGB(255, 231, 236, 251);
  MaterialColor primeColor = MaterialColor(0xFF3399FF, color);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        dividerColor: Colors.black,
        drawerTheme: DrawerThemeData(
            backgroundColor: _primaryColor, scrimColor: accentColor),
        appBarTheme: AppBarTheme(backgroundColor: _primaryColor),
        primaryColor: Color.fromARGB(255, 62, 35, 60),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
        //scaffoldBackgroundColor: Color.fromARGB(255, 29, 33, 63),
        primaryColorDark: Color.fromARGB(255, 0, 0, 0),
        primarySwatch: primeColor,
      ),
     // home: SplashScreen(title: 'Flutter Login'),
      home: MainPage(),
    );
  }
}

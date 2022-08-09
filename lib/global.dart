import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';
import 'package:m2m_flutter_main/pages/meeting_pages.dart';
import 'package:m2m_flutter_main/pages/mentee_page.dart';
import 'package:m2m_flutter_main/pages/mentor_page.dart';
import 'package:m2m_flutter_main/pages/notification.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';

class Variable {
  static int bottomBarIndex = 0;
  static List<Widget> sayfalar = [
    MainPage(),
    ProfilePage(nereyeId: 3),
    MeetPages(),
    MenteePage(),
    MentorPage(),
  ];
  
}

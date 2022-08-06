import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';

class BottomBar extends StatelessWidget {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_selectedIndex) {
      case 0:
    }
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(245,245,245,245),
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
          ),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chats',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.deepOrange,
      onTap: _onTap,
      elevation: 15,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  void setState(Null Function() param0) {}
}
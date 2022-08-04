import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/pages/mentee_page.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';

class MyCircle extends StatelessWidget {
  final child;

  MyCircle({required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary,
            minimumSize: Size(MediaQuery.of(context).size.width * 0.2,
                MediaQuery.of(context).size.height * 0.2),
            //elevation: 3,
          ),
          child: Text(
            '1',
            style: TextStyle(fontSize: 40.0),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/pages/mentee_page.dart';

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
          color: Color.fromARGB(255, 69, 41, 67),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 69, 41, 67),
            minimumSize: Size(MediaQuery.of(context).size.width * 0.3,
                MediaQuery.of(context).size.height * 0.2),
            //elevation: 3,
          ),
          child: Text(
            '1',
            style: TextStyle(fontSize: 40.0),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenteePage()));
          },
        ),
      ),
    );
  }
}

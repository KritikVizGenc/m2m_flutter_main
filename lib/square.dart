import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/pages/mentee_page.dart';

class MySquare extends StatelessWidget {
  final child;

  MySquare({required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 35),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary,
            minimumSize: Size(MediaQuery.of(context).size.width * 0.5,
                MediaQuery.of(context).size.height * 0.5),
            //elevation: 3,
          ),
          child: Text(
            'Comments',
            style: TextStyle(fontSize: 20.0),
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

import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/pages/mentee_page.dart';

class MySquare extends StatelessWidget {
  final child;

  MySquare({required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary,
            minimumSize: Size(MediaQuery.of(context).size.width * 1.2,
                MediaQuery.of(context).size.height * 1.1),
            //elevation: 3,
          ),
          child: Text(
            '1',
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

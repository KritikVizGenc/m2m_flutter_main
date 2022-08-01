import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  final String child;
  MySquare({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 150,
        color: Color.fromARGB(255, 69, 41, 67),
        child: Center(
            child: Text(
          child,
          style: TextStyle(fontSize: 40),
        )),
      ),
    );
  }
}

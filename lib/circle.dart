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
        child: InkWell(
          splashColor: Colors.grey, // Splash color
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenteePage()));
          }, // Handle your onTap here.
          child: Container(height: 200, width: 200),
        ),
        height: 200,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 133, 97, 109),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary,
            minimumSize: Size(MediaQuery.of(context).size.width * 0.2,
                MediaQuery.of(context).size.height * 0.2),
            //elevation: 3,
          ),
          child: Text(
            '',
            style: TextStyle(fontSize: 40.0),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(
                          nereyeId: 2,
                        )));
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/pages/mentee_page.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';

class MyCircle extends StatelessWidget {
  final child;

  MyCircle({required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        //constraints: ,
        child: Ink(
          decoration: BoxDecoration(
            /*image: DecorationImage(
                image: NetworkImage(
                    'https://media.istockphoto.com/photos/cool-cat-with-shades-picture-id1249884596?k=20&m=1249884596&s=612x612&w=0&h=16nnd8JAJW2MdEghUJnaAiZfPezWoVUTAW9bwOE3Z7E='),
                fit: BoxFit.contain),*/
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: Size(MediaQuery.of(context).size.width * 0.2,
                  MediaQuery.of(context).size.height * 0.2),
              //elevation: 3,
            ),
            child: Text(
              '1',
              style: TextStyle(fontSize: 40.0),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
        ),
      ),
    );
  }
}

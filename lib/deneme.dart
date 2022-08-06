import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/pages/mentee_page.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';
import 'package:m2m_flutter_main/pages/widgets/main_widget.dart';
import 'package:m2m_flutter_main/pages/widgets/profile_widget.dart';
import 'package:m2m_flutter_main/utils/user_preferences.dart';

class Deneme extends StatelessWidget {
  final child;

  Deneme({required this.child});
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Column(
      children: [
        /*InkWell(
          child: Ink(
            height: 200,
            padding: const EdgeInsets.all(10.0),
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
        ),*/
        Container( 
          
          child: ListView(
            primary: false, //??
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 24),
              MainProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

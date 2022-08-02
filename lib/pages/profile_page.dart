import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m2m_flutter_main/model/user.dart';
import 'package:m2m_flutter_main/pages/edit_profile_page.dart';
import 'package:m2m_flutter_main/pages/widgets/appbar_widget.dart';
import 'package:m2m_flutter_main/pages/widgets/numbers_widgets.dart';
import 'package:m2m_flutter_main/pages/widgets/profile_widget.dart';
import 'package:m2m_flutter_main/square.dart';
import 'package:m2m_flutter_main/utils/user_preferences.dart';
import '../common/Bottom_Bar.dart';
import '../common/drawer.dart';
import '../common/theme_helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 231, 236, 251),
      //appBar: buildAppBar(context),
      drawer: DrawerHelp(),
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
        //margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 10,
              bottom: 15,
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()));
                      },
                      icon: Icon(
                        size: 20,
                        Icons.edit,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    //Icon(Icons.edit),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView(
                primary: false, //??
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 24),
                  ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditProfilePage()));
                    },
                  ),
                  const SizedBox(height: 24),
                  buildName(user),
                  const SizedBox(height: 24),
                  NumbersWidget(),
                  const SizedBox(height: 48),
                  buildAbout(user),
                  const SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 200, 0),
                    child: Text(
                      'Comments',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 16,
                    ),
                    height: 50,
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Center(child: Text('Entry A')),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 16,
                    ),
                    height: 50,
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Center(child: Text('Entry B')),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.only(
                      left: 30,
                      right: 16,
                    ),
                    height: 50,
                    color: Theme.of(context).colorScheme.secondary,
                    child: const Center(child: Text('Entry C')),
                  ),

                  /*Container(
                  //color: Color.fromARGB(255, 69, 41, 67),

                  height: 150,
                  child: GridView.builder(
                    itemCount: 25,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                    itemBuilder: (context, index) {
                      return MySquare(child: Text("Comments"));
                    },
                  ),
                ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.major,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.city,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}

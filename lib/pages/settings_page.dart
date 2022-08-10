import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';

import 'edit_profile_page.dart';

class SettingPage extends StatefulWidget {
  static final String path = "lib/src/pages/settings/settings1.dart";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late bool _dark;

  @override
  void initState() {
    super.initState();
    _dark = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          //backgroundColor: Colors.transparent,
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
          title: Text(
            'Settings',
            style: TextStyle(color: _dark ? Colors.white : Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.moon),
              onPressed: () {
                setState(() {
                  _dark = !_dark;
                });
              },
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 241, 237, 252),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Theme.of(context).secondaryHeaderColor,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomBar(
                                        indexId: 1,
                                      )));
                        },
                        title: Text(
                          "John Doe",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(avatars[0]),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage()));
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).copyWith().primaryColor,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.0, 1.0],
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).colorScheme.secondary,
                            ],
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.lock_outline,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              title: Text("Change Password"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                //open change password
                              },
                            ),
                            _buildDivider(),
                            ListTile(
                              leading: Icon(
                                FontAwesomeIcons.language,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              title: Text("Change Language"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                //open change language
                              },
                            ),
                            _buildDivider(),
                            ListTile(
                              leading: Icon(
                                Icons.location_on,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              title: Text("Change Location"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                //open change location
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(height: 20.0),
                    // Text(
                    //   "Notification Settings",
                    //   style: TextStyle(
                    //     fontSize: 20.0,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.indigo,
                    //   ),
                    // ),
                    // SwitchListTile(
                    //   activeColor: Colors.purple,
                    //   contentPadding: const EdgeInsets.all(0),
                    //   value: true,
                    //   title: Text("Received notification"),
                    //   onChanged: (val) {},
                    // ),
                    // SwitchListTile(
                    //   activeColor: Colors.purple,
                    //   contentPadding: const EdgeInsets.all(0),
                    //   value: false,
                    //   title: Text("Received newsletter"),
                    //   onChanged: null,
                    // ),
                    // SwitchListTile(
                    //   activeColor: Colors.purple,
                    //   contentPadding: const EdgeInsets.all(0),
                    //   value: true,
                    //   title: Text("Received Offer Notification"),
                    //   onChanged: (val) {},
                    // ),
                    // SwitchListTile(
                    //   activeColor: Colors.purple,
                    //   contentPadding: const EdgeInsets.all(0),
                    //   value: true,
                    //   title: Text("Received App Updates"),
                    //   onChanged: null,
                    // ),
                    //const SizedBox(height: 60.0),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   bottom: -20,
            //   left: -20,
            //   child: Container(
            //     width: 80,
            //     height: 80,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       color: Colors.purple,
            //       shape: BoxShape.circle,
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: 00,
              left: 00,
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.powerOff,
                  color: Colors.white,
                ),
                onPressed: () {
                  //log out
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(),
      width: double.infinity,
      height: 7.0,
      color: Color.fromARGB(255, 241, 237, 252),
    );
  }
}

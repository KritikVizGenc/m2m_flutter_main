import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m2m_flutter_main/model/getById_model.dart';
import 'package:m2m_flutter_main/model/user.dart';
import 'package:m2m_flutter_main/pages/edit_profile_page.dart';
import 'package:m2m_flutter_main/pages/widgets/numbers_widgets.dart';
import 'package:m2m_flutter_main/pages/widgets/profile_widget.dart';
import 'package:m2m_flutter_main/square.dart';
import 'package:m2m_flutter_main/utils/user_preferences.dart';
import '../common/Bottom_Bar.dart';
import '../common/drawer.dart';
import '../common/theme_helper.dart';
import '../model/GetById_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final url = "http://10.0.2.2:5000/api/GetByIdModel/2";

  List<GetByIdModel> productsResponseFromJson(String str) =>
      List<GetByIdModel>.from(
          json.decode(str).map((x) => GetByIdModel.fromJson(x)));

  late Future<List<GetByIdModel>> futureGetByIdModel;
  Future<List<GetByIdModel>> fetchGetByIdModel() async {
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return productsResponseFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureGetByIdModel = fetchGetByIdModel() as Future<List<GetByIdModel>>;
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: FutureBuilder<List<GetByIdModel>>(
                future: futureGetByIdModel,
                builder: (context, i) {
                  if (i.hasData) {
                    return ListView(
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
                        Text('${i.data?[1].name}'),
                        const SizedBox(height: 24),
                        NumbersWidget(),
                        const SizedBox(height: 48),
                        Text('${i.data?[1].surname}'),
                        const SizedBox(height: 24),
                        Text('${i.data?[1].city}'),
                        const SizedBox(height: 24),
                        Text('${i.data?[1].name}'),
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
                          child: Text('${i.data?[1].name}'),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          margin: EdgeInsets.only(
                            left: 30,
                            right: 16,
                          ),
                          height: 50,
                          color: Theme.of(context).colorScheme.secondary,
                          child: Text('${i.data?[1].name}'),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          margin: EdgeInsets.only(
                            left: 30,
                            right: 16,
                          ),
                          height: 50,
                          color: Theme.of(context).colorScheme.secondary,
                          child: Text('${i.data?[1].name}'),
                        ),
                      ],
                    );
                  } else if (i.hasError) {
                    return Text('${i.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
              // child: ListView(
              //   primary: false, //??
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   children: [
              //     const SizedBox(height: 24),
              //     ProfileWidget(
              //       imagePath: user.imagePath,
              //       onClicked: () {
              //         Navigator.of(context).push(MaterialPageRoute(
              //             builder: (context) => EditProfilePage()));
              //       },
              //     ),
              //     const SizedBox(height: 24),
              //     Text(''),
              //     const SizedBox(height: 24),
              //     NumbersWidget(),
              //     const SizedBox(height: 48),
              //     buildAbout(user),
              //     const SizedBox(height: 24),
              //     Container(
              //       padding: EdgeInsets.fromLTRB(0, 20, 200, 0),
              //       child: Text(
              //         'Comments',
              //         style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 24,
              //         ),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //     const SizedBox(height: 10),
              //     Container(
              //       margin: EdgeInsets.only(
              //         left: 30,
              //         right: 16,
              //       ),
              //       height: 50,
              //       color: Theme.of(context).colorScheme.secondary,
              //       child: const Center(child: Text('Entry A')),
              //     ),
              //     const SizedBox(height: 15),
              //     Container(
              //       margin: EdgeInsets.only(
              //         left: 30,
              //         right: 16,
              //       ),
              //       height: 50,
              //       color: Theme.of(context).colorScheme.secondary,
              //       child: const Center(child: Text('Entry B')),
              //     ),
              //     const SizedBox(height: 15),
              //     Container(
              //       margin: EdgeInsets.only(
              //         left: 30,
              //         right: 16,
              //       ),
              //       height: 50,
              //       color: Theme.of(context).colorScheme.secondary,
              //       child: const Center(child: Text('Entry C')),
              //     ),
              //   ],
              // ),
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

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';
import 'package:m2m_flutter_main/pages/registiration_page.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'login_page.dart';
import 'mentee_page.dart';
import 'package:http/http.dart';
import '../common/Listing.dart';
import '../model/getByRole_model.dart';
import '../pages/profile_page.dart';

class MentorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MentorPageState();
  }
}

class _MentorPageState extends State<MentorPage> {
  TextEditingController editingController = TextEditingController();

  final url = "http://10.0.2.2:5000/api/getByRole/mentor";

  List<GetByRoleModel> productsResponseFromJson(String str) =>
      List<GetByRoleModel>.from(
          json.decode(str).map((x) => GetByRoleModel.fromJson(x)));

  late Future<List<GetByRoleModel>> futureGetByRoleModel;
  Future<List<GetByRoleModel>> fetchGetByRoleModel() async {
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
    futureGetByRoleModel =
        fetchGetByRoleModel() as Future<List<GetByRoleModel>>;
  }

  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  void filterSearchResults(String query) {
//search kısmı dolacak
  }
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: DrawerHelp(),
      //bottomNavigationBar: BottomBar(),
      body: FutureBuilder<List<GetByRoleModel>>(
        future: futureGetByRoleModel,
        builder: (context, i) {
          if (i.hasData) {
            return ListView.builder(
                itemCount: i.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfilePage(nereyeId: i.data?[index].id)));
                      },
                      title: Text('${i.data?[index].name}' +
                          '   ' +
                          '${i.data?[index].surname}' +
                          ' \n ' +
                          '${i.data?[index].userRole}'),
                      subtitle: Text('${i.data?[index].email}'),
                      leading: CircleAvatar(
                        child: Text('${i.data?[index].name[0]}'),
                      ));
                });
          } else if (i.hasError) {
            return Text('${i.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Mentor Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
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
      ),
    );
  }
}

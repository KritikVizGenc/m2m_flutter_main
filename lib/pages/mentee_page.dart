import 'dart:convert';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/pages/mentor_page.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';
import 'package:m2m_flutter_main/pages/registiration_page.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import '../common/Listing.dart';
import 'package:http/http.dart';
import '../model/getByRole_model.dart';

import 'login_page.dart';
import 'main_page.dart';

class MenteePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenteePageState();
  }
}

class _MenteePageState extends State<MenteePage> {
  TextEditingController editingController = TextEditingController();
  TextEditingController editingController1 = TextEditingController();

  final url = "http://10.0.2.2:5000/api/getByRole/mentee";

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

  @override
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  void filterSearchResults(String query) {}

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {},
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Arama yapmak istediğiniz etiketi giriniz.",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            ),
          ),
          Container(
            child: FutureBuilder<List<GetByRoleModel>>(
              future: futureGetByRoleModel,
              builder: (context, i) {
                if (i.hasData) {
                  return ListView.builder(
                      itemCount: i.data?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
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
          ),
        ]),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Mentee Page",
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
      ),
      // elevation: 0.5,
      // iconTheme: IconThemeData(color: Colors.white),
      // flexibleSpace: Container(
      //   decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //           colors: <Color>[
      //         //Theme.of(context).primaryColor,
      //         //Theme.of(context).colorScheme.secondary,
      //       ])),
      // ),

      // actions: [
      //   IconButton(
      //     icon: const Icon(Icons.search),
      //     onPressed: () {
      //       showSearch(context: context, delegate: MySearchDelegate());
      //     },
      //   ),
      // ],

      drawer: DrawerHelp(),
      bottomNavigationBar: BottomBar(),
    );
  }
}

// class MySearchDelegate extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     throw UnimplementedError();
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     throw UnimplementedError();
//   }
// }

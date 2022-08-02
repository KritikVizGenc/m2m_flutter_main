import 'dart:convert';

import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/pages/mentor_page.dart';
import 'package:m2m_flutter_main/pages/registiration_page.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import '../common/Listing.dart';
import 'package:http/http.dart';

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

  final url = "http://10.0.2.2:5000/api/getAll";

  var _postsJson = [];

  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  final duplicateItems = List<String>.generate(10000, (i) => "Eleman $i");
  //var items = lis

  @override
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  void filterSearchResults(String query) {}

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: _postsJson.length,
            itemBuilder: (context, i) {
              final post = _postsJson[i];

              return Text(
                  "Id:${post["id"]} Surname: ${post["surname"]} \n email: ${post["email"]} \n\n");
            }),

//       Center(
//  child:
//       ListView(
//         padding: const EdgeInsets.all(8),
//         children: <Widget>[
//           SizedBox(height:15,),
//           TextField( onChanged: (value){

//           },
//             decoration: InputDecoration(
//               labelText: "Listeyi ara",
//               hintText: "Aramak için yaz",
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius:BorderRadius.all(Radius.circular(10))
//                  ),
//             ),

//           ),
//           Card(child:ListTile(
//             title: Text("NAME"),
//             subtitle: Text("HI,I am the MENTEE."),
//             leading: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
//             trailing: Icon(Icons.person_add_alt_rounded))),
//           Card(
//             child:ListTile(
//               title: Text("NAME"),subtitle: Text("Mentee."),
//               leading: CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
//               trailing: Icon(Icons.person_add_alt_rounded)
//               )
//               ),
//           Card(
//             child:ListTile(
//               title: Text("NAME"),
//               subtitle: Text("Mentee."),
//               leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
//                trailing: Icon(Icons.person_add_alt_rounded)
//                )
//                ),
//           Card(
//             child:ListTile( title: Text("NAME"),
//             subtitle: Text("Mentee."),
//             leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
//             trailing: Icon(Icons.person_add_alt_rounded)
//             )
//             )

//         ],
//       ),

// ),

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
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
            ),
          ],
        ),
        //       body: Center(
        //       child:Card(

        //   //   child: InkWell(
        //   //     splashColor: Colors.black,
        //   //     onTap: () {
        //   //       debugPrint('Card tapped.');
        //   //     },

        //   //     child: const SizedBox(
        //   //       width: 300,
        //   //       height: 100,
        //   //       child: Text('Mentors'),
        //   //     ),

        //   //   ),

        //   ),

        // ),
        drawer: DrawerHelp(),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}

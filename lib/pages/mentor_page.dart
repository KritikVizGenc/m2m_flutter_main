import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/pages/registiration_page.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'login_page.dart';
import 'mentee_page.dart';

class MentorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MentorPageState();
  }
}

class _MentorPageState extends State<MentorPage> {
   TextEditingController editingController = TextEditingController();
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
   void filterSearchResults(String query){

//search kısmı dolacak
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerHelp(),
      bottomNavigationBar: BottomBar(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
             //searchbar için gerekli
          SizedBox(height:15,),
          TextField( onChanged: (value){

          },
            decoration: InputDecoration(
              labelText: "Listeyi ara",
              hintText: "Aramak için yaz",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius:BorderRadius.all(Radius.circular(10))
                 ),
            ),

          ),
            Card(
                child: ListTile(
                    title: Text("NAME"),
                    subtitle: Text("HI,I am the MENTOR."),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                    trailing: Icon(Icons.person_add_alt_rounded))),
            Card(
                child: ListTile(
                    title: Text("NAME"),
                    subtitle: Text("Mentor."),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                    trailing: Icon(Icons.person_add_alt_rounded))),
            Card(
                child: ListTile(
                    title: Text("NAME"),
                    subtitle: Text("Mentor."),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                    trailing: Icon(Icons.person_add_alt_rounded))),
            Card(
                child: ListTile(
                    title: Text("NAME"),
                    subtitle: Text("Mentor."),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                    trailing: Icon(Icons.person_add_alt_rounded)))
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Mentor Page",
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
    );
  }
}

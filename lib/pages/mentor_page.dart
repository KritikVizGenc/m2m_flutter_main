import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/model/getById_model.dart';
import 'package:m2m_flutter_main/pages/registiration_page.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/pages/widgets/numbers_widgets.dart';
import 'package:m2m_flutter_main/pages/widgets/stars.dart';
import 'package:m2m_flutter_main/service/api_service.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
import 'login_page.dart';
import 'mentee_page.dart';
import 'package:http/http.dart';
import '../common/Listing.dart';
import '../model/getByRole_model.dart';
import '../pages/profile_page.dart';

class MentorPage extends StatefulWidget {
  const MentorPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MentorPageState();
  }
}

class _MentorPageState extends State<MentorPage> {
  TextEditingController editingController = TextEditingController();

  Future<List<GetByRoleModel>?> futureAllMentors = APIService.getAllMentors();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  void filterSearchResults(String query) {
//search kısmı dolacak
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerHelp(),
      body: FutureBuilder<List<GetByRoleModel>?>(
        future: futureAllMentors,
        builder: (context, i) {
          if (i.hasData) {
            return Container(
              width: 600,
              child: ListView.builder(
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
                      title: Container(
                        color:
                        Color.fromARGB(255, 225, 217, 226).withOpacity(0.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('${i.data?[index].name}' +
                                '   ' +
                                '${i.data?[index].surname}'),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('${i.data?[index].ratingAverage}'),
                              ),
                            ),
                            Stars(average: i.data?[index].ratingAverage),
                          ],
                        ),
                      ),
                      subtitle: Text('${i.data?[index].city}'),
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 197, 194, 194),
                        child: Text('${i.data?[index].name[0]}'),
                      ),
                      trailing: Column(
                        children: <Widget>[],
                      ),
                    );
                  }),
            );
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
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/circle.dart';
import 'package:m2m_flutter_main/model/getAllTags_model.dart';
import 'package:m2m_flutter_main/model/getMyMentees_model.dart';
import 'package:m2m_flutter_main/model/getMyMentors_model.dart';
import 'package:m2m_flutter_main/pages/categories_page.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';
import 'package:m2m_flutter_main/square.dart';
import 'package:table_calendar/table_calendar.dart';
import 'add_task_bar_page.dart';
import 'login_page.dart';
import 'mentee_page.dart';
import 'mentor_page.dart';
import 'splash_screen.dart';
import 'widgets/header_widget.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:http/http.dart';

import 'package:m2m_flutter_main/square.dart';
import 'registiration_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List _posts = [
    'post 1',
    'post 2 ',
    'post 3',
    'post 4',
  ];

  final List _stories = [
    'fav 1',
    'fav 2 ',
    'fav 3',
    'fav 4',
    'fav 5',
  ];

  final url = "http://10.0.2.2:5000/api/myMentees/17";

  List<GetMyMenteesModel> productsResponseFromJson(String str) =>
      List<GetMyMenteesModel>.from(
          json.decode(str).map((x) => GetMyMenteesModel.fromJson(x)));

  late Future<List<GetMyMenteesModel>> futureGetByRoleModel;
  Future<List<GetMyMenteesModel>> fetchGetByRoleModel() async {
    final response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return productsResponseFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  final url2 = "http://10.0.2.2:5000/api/myMentors/13";

  List<GetMyMentorsModel> productsResponseFromJson2(String str) =>
      List<GetMyMentorsModel>.from(
          json.decode(str).map((x) => GetMyMentorsModel.fromJson(x)));

  late Future<List<GetMyMentorsModel>> futureGetByRoleModel2;
  Future<List<GetMyMentorsModel>> fetchGetByRoleModel2() async {
    final response = await get(Uri.parse(url2));

    if (response.statusCode == 200) {
      return productsResponseFromJson2(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  final url3 = "http://10.0.2.2:5000/api/getAllTag";

  List<GetAllTagsModel> productsResponseFromJson3(String str) =>
      List<GetAllTagsModel>.from(
          json.decode(str).map((x) => GetAllTagsModel.fromJson(x)));

  late Future<List<GetAllTagsModel>> futureGetByRoleModel3;
  Future<List<GetAllTagsModel>> fetchGetByRoleModel3() async {
    final response = await get(Uri.parse(url3));

    if (response.statusCode == 200) {
      return productsResponseFromJson3(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureGetByRoleModel =
    fetchGetByRoleModel() as Future<List<GetMyMenteesModel>>;

    futureGetByRoleModel2 =
    fetchGetByRoleModel2() as Future<List<GetMyMentorsModel>>;

    futureGetByRoleModel3 =
    fetchGetByRoleModel3() as Future<List<GetAllTagsModel>>;
  }

  Widget _userCard(
      String imageUrl, String name, String surname, double rating, int id) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromARGB(255, 231, 236, 251),
            width: 4,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(nereyeId: id)));
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 62, 35, 60),
              radius: 43,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          Text(
            (name) + (' ') + (surname),
            style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Color.fromARGB(255, 217, 169, 25),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Transform(
      transform: new Matrix4.identity()..scale(1.3),
      child: new Chip(
        labelPadding: EdgeInsets.all(2.0),
        label: Container(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: color,
        elevation: 15.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(8.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 236, 251),
      drawer: DrawerHelp(),
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Text(
          "Main Page",
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
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notification_add),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
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
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 200, 0),
                child: Text(
                  'My Mentors',
                  style: TextStyle(
                      color: Color.fromARGB(255, 50, 28, 49),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: TextButton(
                  child: Text(
                    'See all',
                    style: TextStyle(
                        color: Color.fromARGB(255, 50, 28, 49),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MentorPage()));
                  },
                ),
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                margin: EdgeInsets.all(5.0),
                height: 155,
                width: 800,
                child: FutureBuilder<List<GetMyMentorsModel>>(
                  future: futureGetByRoleModel2,
                  builder: (context, i) {
                    if (i.hasData) {
                      return GridView.builder(
                          padding: const EdgeInsets.all(0.0),
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1),
                          scrollDirection: Axis.horizontal,
                          itemCount: i.data?.length,
                          itemBuilder: (context, index) {
                            return _userCard(
                                'https://productimages.hepsiburada.net/s/40/1500/10650895351858.jpg',
                                '${i.data?[index].myMentorsName}',
                                '${i.data?[index].myMentorsSurname}',
                                i.data![index].myMentorsRatingAverage,
                                i.data![index].myMentorsId);
                          });
                    } else if (i.hasError) {
                      return Text('${i.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 175, 0),
                child: Text(
                  'Top Mentors',
                  style: TextStyle(
                      color: Color.fromARGB(255, 50, 28, 49),
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: TextButton(
                  child: Text(
                    'See all',
                    style: TextStyle(
                        color: Color.fromARGB(255, 50, 28, 49),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MentorPage()));
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              margin: EdgeInsets.all(5.0),
              height: 155,
              child: FutureBuilder<List<GetMyMenteesModel>>(
                future: futureGetByRoleModel,
                builder: (context, i) {
                  if (i.hasData) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                        scrollDirection: Axis.horizontal,
                        itemCount: i.data?.length,
                        itemBuilder: (context, index) {
                          return _userCard(
                              'https://productimages.hepsiburada.net/s/40/1500/10650895351858.jpg',
                              '${i.data?[index].myMenteesName}',
                              '${i.data?[index].myMenteesSurname}',
                              i.data![index].myMenteesRatingAverage,
                              i.data![index].myMenteesId);
                        });
                  } else if (i.hasError) {
                    return Text('${i.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),

          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 180, 0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      color: Color.fromARGB(255, 50, 28, 49),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: TextButton(
                  child: Text(
                    'See all',
                    style: TextStyle(
                        color: Color.fromARGB(255, 50, 28, 49),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriesPage()));
                  },
                ),
              ),
            ],
          ),
          // Container(
          //   height: 150,
          //   child: GridView.builder(
          //     itemCount: 5,
          //     gridDelegate:
          //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          //     itemBuilder: (context, index) {
          //       return MySquare(child: Text("1"));
          //     },
          //   ),
          // ),
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: FutureBuilder<List<GetAllTagsModel>>(
                future: futureGetByRoleModel3,
                builder: (context, i) {
                  if (i.hasData) {
                    return GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 95,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 0),
                        itemCount: i.data?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(right: 10, left: 20),
                            child: _buildChip(
                                '${i.data?[index].tagName}', Colors.purple),
                          );
                        });
                  } else if (i.hasError) {
                    return Text('${i.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
        ]),

        //     body: ListView(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        //           child: Column(
        //             children: [
        //               Container(
        //                 padding: EdgeInsets.fromLTRB(290, 0, 0, 0),
        //                 child: TextButton(
        //                   child: Text(
        //                     'See all',
        //                     style: TextStyle(
        //                         color: Color.fromARGB(255, 50, 28, 49),
        //                         fontSize: 15,
        //                         fontWeight: FontWeight.bold),
        //                   ),
        //                   onPressed: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => MentorPage()));
        //                   },
        //                 ),
        //               ),
        //               Container(
        //                 color: Color.fromARGB(255, 69, 41, 67),
        //                 height: 150,
        //                 child: GridView.builder(
        //                   scrollDirection: Axis.horizontal,
        //                   itemCount: 25,
        //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                       crossAxisCount: 1),
        //                   itemBuilder: (context, index) {
        //                     return MyCircle(child: Text("1"));
        //                   },
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        //           child: Column(
        //             children: [
        //               Container(
        //                 padding: EdgeInsets.fromLTRB(290, 0, 0, 0),
        //                 child: TextButton(
        //                   child: Text(
        //                     'See all',
        //                     style: TextStyle(
        //                         color: Color.fromARGB(255, 50, 28, 49),
        //                         fontSize: 15,
        //                         fontWeight: FontWeight.bold),
        //                   ),
        //                   onPressed: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => MentorPage()));
        //                   },
        //                 ),
        //               ),
        //               Container(
        //                 color: Color.fromARGB(255, 69, 41, 67),
        //                 height: 150,
        //                 child: GridView.builder(
        //                   scrollDirection: Axis.horizontal,
        //                   itemCount: 25,
        //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                       crossAxisCount: 1),
        //                   itemBuilder: (context, index) {
        //                     return MyCircle(child: Text("1"));
        //                   },
        //                 ),
        //               ),
        //               Container(
        //                 padding: EdgeInsets.fromLTRB(0, 40, 240, 0),
        //                 child: Text(
        //                   'Categories',
        //                   style: TextStyle(
        //                       color: Color.fromARGB(255, 50, 28, 49),
        //                       fontSize: 25,
        //                       fontWeight: FontWeight.bold),
        //                 ),
        //               ),
        //               Container(
        //                 height: 150,
        //                 child: GridView.builder(
        //                   itemCount: 5,
        //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                       crossAxisCount: 3),
        //                   itemBuilder: (context, index) {
        //                     return MySquare(child: Text("1"));
        //                   },
        //                 ),
        //               ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   );
        // }

        // Column ss() {
        //   return Column(
        //     children: [
        //       Container(
        //         //padding: const EdgeInsets.symmetric(vertical: 8.0),
        //         height: 150,
        //         color: Color.fromARGB(255, 231, 236, 251),
        //         child: ListView.builder(
        //             itemCount: _stories.length,
        //             scrollDirection: Axis.horizontal,
        //             itemBuilder: (context, index) {
        //               return MyCircle(
        //                 child: _stories[index],
        //               );
        //             }),
        //       ),
        //       Container(
        //         height: 150,
        //         color: Color.fromARGB(255, 231, 236, 251),
        //         child: ListView.builder(
        //             itemCount: _stories.length,
        //             scrollDirection: Axis.horizontal,
        //             itemBuilder: (context, index) {
        //               return MyCircle(
        //                 child: _stories[index],
        //               );
        //             }),
      ),
    );
  }
<<<<<<< HEAD
}
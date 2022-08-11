import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m2m_flutter_main/model/commentRequest_model.dart';
import 'package:m2m_flutter_main/model/getById_model.dart';
import 'package:m2m_flutter_main/model/getById_model.dart';
import 'package:m2m_flutter_main/model/user.dart';
import 'package:m2m_flutter_main/pages/edit_profile_page.dart';
import 'package:m2m_flutter_main/pages/widgets/header_profile_widget.dart';
import 'package:m2m_flutter_main/pages/widgets/header_widget.dart';
import 'package:m2m_flutter_main/pages/widgets/numbers_widgets.dart';
import 'package:m2m_flutter_main/pages/widgets/profile_widget.dart';
import 'package:m2m_flutter_main/pages/widgets/textfield_widget.dart';
import 'package:m2m_flutter_main/service/api_service.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
import 'package:m2m_flutter_main/square.dart';
import 'package:m2m_flutter_main/utils/user_preferences.dart';
import '../common/Bottom_Bar.dart';
import '../common/drawer.dart';
import '../common/theme_helper.dart';

import 'package:http/http.dart';
import 'dart:typed_data';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  final int? nereyeId;

  const ProfilePage({Key? key, required this.nereyeId}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int? ownerID;
  final commentController = TextEditingController();
  List<GetByIdModel> productsResponseFromJson(String str) =>
      List<GetByIdModel>.from(
          json.decode(str).map((x) => GetByIdModel.fromJson(x)));

  late Future<List<GetByIdModel>> futureGetByIdModel;
  Future<List<GetByIdModel>> fetchGetByIdModel(nereyeId) async {
    Uri url = Uri.http(
      '10.0.2.2:5000',
      '/api/getById/${jsonEncode(nereyeId)}',
    );

    final response = await get(Uri.parse(url.toString()));

    if (response.statusCode == 200) {
      return productsResponseFromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  List<CommentModel> productsResponseFromJson1(String str) =>
      List<CommentModel>.from(
          json.decode(str).map((x) => CommentModel.fromJson(x)));

  late Future<List<CommentModel>> futureCommentModel;
  Future<List<CommentModel>> fetchCommentModel(nereyeId) async {
    Uri url1 = Uri.http(
      '10.0.2.2:5000',
      '/api/getComment/${jsonEncode(nereyeId)}',
    );
    final response = await get(Uri.parse(url1.toString()));

    if (response.statusCode == 200) {
      return productsResponseFromJson1(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureGetByIdModel =
        fetchGetByIdModel(widget.nereyeId) as Future<List<GetByIdModel>>;
    futureCommentModel =
        fetchCommentModel(widget.nereyeId) as Future<List<CommentModel>>;
  }

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 100;
    final user = UserPreferences.myUser;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 237, 252),
      //appBar: buildAppBar(context),
      drawer: DrawerHelp(),
      // bottomNavigationBar: BottomBar(),
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
                Theme.of(context).primaryColor.withOpacity(0.4),
                Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ])),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () async {
              int? currentUserId = await SharedService.loginDetails();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                            nereyeId: currentUserId,
                          )));
            },
          )
        ],
        
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: FutureBuilder<List<GetByIdModel>>(
              future: futureGetByIdModel,
              builder: (context, i) {
                if (i.hasData) {
                  ownerID = i.data?[0].id;
                  Uint8List _bytes;
                  _bytes = Base64Decoder().convert('${i.data?[0].avatar}');
                  return ListView(
                    primary: false, //??
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: 24),
                      ProfileWidget(
                        imagePath: _bytes,
                        onClicked: () async {
                          int? currentUserId =
                              await SharedService.loginDetails();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditProfilePage(
                                    nereyeId: currentUserId,
                                  )));
                        },
                      ),
                      const SizedBox(height: 24),
                      buildName('${i.data?[0].name}', '${i.data?[0].surname}',
                          '${i.data?[0].work}', '${i.data?[0].city}'),
                      const SizedBox(height: 24),
                      NumbersWidget(average: i.data?[0].ratingAverage),
                      const SizedBox(height: 48),
                      buildAbout('${i.data?[0].aboutMe}'),
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
                    ],
                  );
                } else if (i.hasError) {
                  return Text('${i.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          Container(
            child: FutureBuilder<List<CommentModel>>(
              future: futureCommentModel,
              builder: (context, i) {
                if (i.hasData) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                      scrollDirection: Axis.vertical,
                      itemCount: i.data?.length,
                      itemBuilder: (context, index) {
                        return buildComment('${i.data?[index].commentContent}');
                      });
                } else if (i.hasError) {
                  return Text('${i.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 200, 0),
            child: TextFormField(
              maxLength: 255,
              controller: commentController,
              decoration: ThemeHelper().textInputDecoration(
                  'Comment..', 'Enter Your Comment to This Mentor! '),
            ),
          ),
          Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      'Okey!',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    int? currentUserId = await SharedService.loginDetails();
                    CommentRequestModel model = CommentRequestModel(
                        commentContent: commentController.text,
                        ownerId: ownerID!,
                        authorId: currentUserId!);
                  }))
        ]),
      ),
    );
  }

  Widget buildName(
    String name,
    String surname,
    String major,
    String city,
  ) =>
      Column(
        children: [
          Text(
            name + ' ' + surname,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            major,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            city,
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ],
      );

  Widget buildAbout(String about) => Container(
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
              about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}

Widget buildComment(String comment) {
  return Container(
    margin: EdgeInsets.only(
      left: 30,
      right: 16,
    ),
    height: 50,
    color: Color.fromARGB(255, 255, 255, 255),
    child: Text(comment),
  );
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m2m_flutter_main/model/update_user_request_model.dart';
import 'package:m2m_flutter_main/pages/profile_page.dart';
import 'package:m2m_flutter_main/pages/widgets/profile_widget.dart';
import 'package:m2m_flutter_main/pages/widgets/textfield_widget.dart';
import 'package:m2m_flutter_main/utils/user_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../service/api_service.dart';
import '../common/theme_helper.dart';
import '../model/user.dart';

class EditProfilePage extends StatefulWidget {
  final int? nereyeId;

  const EditProfilePage({Key? key, required this.nereyeId}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? image;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final aboutMeController = TextEditingController();
  final avatarController = TextEditingController();
  final cityController = TextEditingController();
  final workController = TextEditingController();

  User user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 236, 251),
        appBar: AppBar(
          title: Text(
            "Edit",
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
                size: 30,
                Icons.done,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              nereyeId: 2,
                            )));
              },
            )
          ],
          //margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 24,
            ),
            // ProfileWidget(
            //   imagePath: user.imagePath,
            //   isEdit: true,
            //   onClicked: () => pickImage(ImageSource.gallery),
            // ),
            const SizedBox(
              height: 24,
            ),
            Container(
              child: TextFormField(
                controller: nameController,
                decoration: ThemeHelper()
                    .textInputDecoration('First Name', 'Enter your first name'),
                onChanged: (name) {},
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            Container(
              child: TextFormField(
                controller: surnameController,
                decoration: ThemeHelper()
                    .textInputDecoration('First Name', 'Enter your first name'),
                onChanged: (name) {},
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            Container(
              child: TextFormField(
                controller: aboutMeController,
                decoration: ThemeHelper()
                    .textInputDecoration('First Name', 'Enter your first name'),
                onChanged: (name) {},
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            Container(
              child: TextFormField(
                controller: cityController,
                decoration: ThemeHelper()
                    .textInputDecoration('First Name', 'Enter your first name'),
                onChanged: (name) {},
              ),
            ),
            Container(
              child: TextFormField(
                controller: workController,
                decoration: ThemeHelper()
                    .textInputDecoration('First Name', 'Enter your first name'),
                onChanged: (name) {},
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                top: 16,
                right: 16,
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: ElevatedButton(
                          style: ThemeHelper().buttonStyle(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          onPressed: () {
                            UpdateUserRequestModel model =
                                UpdateUserRequestModel(
                                    aboutMe: aboutMeController.text,
                                    city: cityController.text,
                                    name: nameController.text,
                                    surname: surnameController.text,
                                    work: workController.text,
                                    avatar: avatarController.text);
                            APIService.updateUser(2, model).then(
                              (response) => {
                                if (response.message != null)
                                  {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProfilePage(
                                                  nereyeId: 2,
                                                ))),
                                  }
                                else
                                  {
                                    FormHelper.showSimpleAlertDialog(context,
                                        "Error", response.message!, "OK", () {
                                      Navigator.pop(context);
                                    })
                                  }
                              },
                            );
                          }))
                ],
              ),
            )
          ],
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/pages/widgets/textfield_widget.dart';

import '../common/theme_helper.dart';

class FeedBack extends StatefulWidget {
  @override
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  List<bool> isTypeSelected = [false, false, false, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 237, 245),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 2.0,
        centerTitle: true,
        title: Text(
          "Feedback",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 248, 237, 245),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Full Name',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'Email*',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              /*TextFieldWidget(
                label: 'Full Name',
                text: 'Name Surname',
                onChanged: (name) {},
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldWidget(
                label: 'Email',
                text: 'email',
                onChanged: (major) {},
              ),
              const SizedBox(
                height: 24,
              ),*/
              const SizedBox(
                height: 24,
              ),
              Text(
                "Please define the type of the feedback",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              buildFeedbackForm(),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(),
                        child: Text(
                          "Submit".toUpperCase(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildFeedbackForm() {
    return Container(
      color: Color.fromARGB(255, 235, 227, 227),
      height: 150,
      child: Stack(
        children: [
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Please briefly describe the issue",
              hintStyle: TextStyle(
                  fontSize: 13.0,
                  color: Color.fromARGB(255, 44, 42, 42),
                  fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

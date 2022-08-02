import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
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
    /*leading: BackButton(color: Colors.black),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        color: Colors.black,
        icon: Icon(Icons.edit),
        onPressed: (() {}),
      ),
    ]*/
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_page.dart';
import 'mentee_page.dart';
import 'mentor_page.dart';
import 'splash_screen.dart';
import 'widgets/header_widget.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
//import 'package:'

import 'registiration_page.dart';

class MainPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{

  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    
   child : Scaffold(
      drawer: DrawerHelp(),
       bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Text("Main Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
       
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary,]
              )
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only( top: 16, right: 16,),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notification_add),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
                    constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
                   
                  ),
                )
              ],
              
            ),
          )
        ],
      ),

body: ListView(
  physics: NeverScrollableScrollPhysics(),
  
  children: [
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
  
  height: 200,
  
  color: Colors.deepPurple[200],
  

  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
  
  height: 200,
  
  color: Colors.deepPurple[200],
  


  ),
),

Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
  
  height: 200,
  
  color: Colors.deepPurple[200],
  


  ),

),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
  
  height: 200,
  
  color: Colors.deepPurple[200],
  


  ),
),


],







)





     
  
       
     
    ),
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/pages/registiration_page.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';

import 'login_page.dart';
import 'mentee_page.dart';

class MentorPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MentorPageState();
  }
}

class _MentorPageState extends State<MentorPage>{
  
   double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override

  Widget build(BuildContext context) {
    
    return Scaffold(
body: Center(
 child:
      ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
        
        
          Card(child:ListTile(
            title: Text("NAME"),

            subtitle: Text("HI,I am the MENTOR."),
            leading: CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
            trailing: Icon(Icons.person_add_alt_rounded))),
          Card(child:ListTile( title: Text("NAME"),subtitle: Text("Mentor."), leading: CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.person_add_alt_rounded))),
          Card(child:ListTile( title: Text("NAME"),subtitle: Text("Mentor."), leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.person_add_alt_rounded))),
          Card(child:ListTile( title: Text("NAME"),subtitle: Text("Mentor."), leading:  CircleAvatar(backgroundImage: NetworkImage("https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")), trailing: Icon(Icons.person_add_alt_rounded)))
        ],
      ),
    
),

 backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Mentee Page",
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


      ),

drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  ]
              )
          ) ,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor,Theme.of(context).colorScheme.secondary,],
                  ),
                ),
               
                child: Container(
                 
                  height: 40,
                  alignment: Alignment.center,
                  child: Column(children: [
                    

                    Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        
                        BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(5, 5),),
                      ],
                    ),
                    child: Icon(Icons.person, size: 45, color: Colors.grey.shade300,),
                  
                  ),
                   Text('\nHome', style: TextStyle(fontSize: 26, color: Theme.of(context).colorScheme.onPrimary),),

                   
                         
                  ],
                  ),
                  
                
                ),
                ),
              
              ListTile(
                leading: Icon(Icons.home, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary,),
                title: Text('Home', style: TextStyle(fontSize: 17, color: Theme.of(context).colorScheme.secondary),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: "Splash Screen")));
                },
              ),
              
               ListTile(
                leading: Icon(Icons.category, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary,),
                title: Text('Categories', style: TextStyle(fontSize: 17, color: Theme.of(context).colorScheme.secondary),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: "Splash Screen")));
                },
              ),
               Divider(color: Theme.of(context).primaryColor, height: 1,),
               ListTile(
                leading: Icon(Icons.meeting_room, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary,),
                title: Text('Meetings', style: TextStyle(fontSize: 17, color: Theme.of(context).colorScheme.secondary),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: "Splash Screen")));
                },
              ),
              ListTile(
                leading: Icon(Icons.people_outline ,size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary),
                title: Text('Mentors', style: TextStyle(fontSize: _drawerFontSize, color: Theme.of(context).colorScheme.secondary),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MentorPage()),);
                },
              ),
             
              ListTile(
                leading: Icon(Icons.people_alt, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary),
                title: Text('Mentees',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MenteePage()),);
                },
              ),
             
             
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.settings, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary,),
                title: Text('Settings', style: TextStyle(fontSize: 17, color: Theme.of(context).colorScheme.secondary),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: "Splash Screen")));
                },
              ),
              ListTile(
                leading: Icon(Icons.help_center, size: _drawerIconSize, color: Theme.of(context).colorScheme.secondary,),
                title: Text('Help', style: TextStyle(fontSize: 17, color: Theme.of(context).colorScheme.secondary),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(title: "Splash Screen")));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Theme.of(context).colorScheme.secondary,),
                title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).colorScheme.secondary),),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),
bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border),
        label: 'Favorite',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_outline),
        label: 'Chats',
      ),
    ],
  ),



    );
  }
}
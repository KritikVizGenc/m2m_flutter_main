

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


import 'package:flutter/material.dart';

class VideoCallPage extends StatelessWidget {
  const VideoCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
body: Column(
  
  children: [
  Padding(
    padding: const EdgeInsets.fromLTRB(20,40,0,0),
    child: ElevatedButton.icon(
      onPressed: (){}, 
      icon: Icon(Icons.add), 
      label: Text("New Meeting"),
      style: ElevatedButton.styleFrom(
fixedSize: Size(350,30),
primary: Colors.indigo[100],
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(25),
),
      ),
      ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: OutlinedButton.icon(
      onPressed: (){}, 
      icon: Icon(Icons.margin), 
      label: Text("Join with a code"),
      style: OutlinedButton.styleFrom(
        fixedSize: Size(350,30),
       shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(25)),

      ),
      ),
  )
]),
    );
  }
}
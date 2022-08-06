import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key,required this.label,required this.onTap}) : super(key: key);

  final String label;
  final Function()? onTap;

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: onTap,
child: Container(
  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
  width: 100,
  height: 40,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Color.fromARGB(255, 62, 35, 60)
  ),
child: Text(
  textAlign: TextAlign.center,

  label,
  
  style:TextStyle(
    
    
    color:Colors.white ,
    
    ) ,
),

),


    );
  }
}
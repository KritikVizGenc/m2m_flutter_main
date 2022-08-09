import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:m2m_flutter_main/common/theme_helper.dart';
import 'package:m2m_flutter_main/pages/add_task_bar_page.dart';
import 'package:m2m_flutter_main/pages/widgets/button.dart';
import '../common/Bottom_Bar.dart';
import '../common/drawer.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';




class MeetPages extends StatefulWidget {
  const MeetPages({ Key? key }) : super(key: key);

  @override
  MeetPagesState createState() => MeetPagesState();
}

class MeetPagesState extends State<MeetPages> {
 DateTime _selectedDate = DateTime.now();
 
 @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerHelp(),
        bottomNavigationBar: BottomBar(),
       
       appBar: AppBar(
          title: Text(
            "EVENT Page",
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
                //Theme.of(context).primaryColor,
                //Theme.of(context).colorScheme.secondary,
              ])),
        ),
        //margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            
          )
        ],
      ),



       
     
      body: Column(
        
        children: [
_addTaskBar(),

_addDateBAr(),

 // taskWidget(Color(0xfff96860),"Meeting with ...","9:30 AM" ),
 //   taskWidget(Color.fromARGB(255, 79, 66, 104),"Meeting with ...","9:30 AM"),
 //    taskWidget(Color.fromARGB(255, 233, 219, 91),"Meeting with ...","9:30 AM"),
  
  ],
   

  












  ),




);
  }

_addDateBAr(){
  return Container(
  margin: const EdgeInsets.only(top: 20,left:20 ),
  child: DatePicker(
  DateTime.now(),
  height: 100,
  width: 80,
  initialSelectedDate: DateTime.now(),
  selectionColor: Color.fromARGB(255, 62, 35, 60),
  selectedTextColor: Colors.white,
  dateTextStyle: GoogleFonts.lato(
textStyle: TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.grey
),
  ),
dayTextStyle: GoogleFonts.lato(
textStyle: TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Colors.grey
),
),
monthTextStyle: GoogleFonts.lato(
textStyle: TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.grey
),
  ),
  onDateChange: (date){
_selectedDate =date;
  },
  ),
  
  );
}





    _addTaskBar(){
return Container(
  margin:const EdgeInsets.only(left:20,right: 20,top: 10) ,
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    
  
    
  
    
  
    
  
    children: [
  
  
  
  
  
  
  
  
  
    Container(
  
      
  
      
  
      child: Column(
  
        crossAxisAlignment: CrossAxisAlignment.start,
  
        children: [
  
         Text(DateFormat.yMMMMd().format(DateTime.now()),
  
         style: subHeadingStyle,
  
         
  
         ),
  
         Text("Today",
  
         style: HeadingStyle,
  
         )
  
        ],
  
      ),
  
    ),
  
  
  MyButton(label: "+ Add Task", onTap:() => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddTaskPage())))
  
  
  
  
  
  
  
  ],
  

  
  ),
);

      
    }
 
//  Slidable taskWidget(Color color,String title,String time){
//   return Slidable(
//   actionPane:SlidableDrawerActionPane(),
//   actionExtentRatio:0.3 ,
//   child:Container(
// height: 80,
// margin:EdgeInsets.symmetric(horizontal: 20,vertical: 10) ,
// decoration: BoxDecoration(
//   color: Colors.white,
//   boxShadow: [BoxShadow(
//     color: Colors.black.withOpacity(0.03),
//     offset: Offset(0,9),
//     blurRadius: 20,
//     spreadRadius: 1
//
//   )]
// ),
//
// child: Row(children: [
//   Container(
//     margin:EdgeInsets.symmetric(horizontal:20 ) ,
//   height: 25,
//   width: 25,
//   decoration: BoxDecoration(
// color: Colors.white,
// shape: BoxShape.circle,
// border: Border.all(color:color,width: 4)
//
//   ),
//
//
//   ),
//   Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
//   Text(title, style:TextStyle(
//     color: Colors.black,
//   ) ,)
// ],
//
//   ),
//
//
//
//
//
// ]),
//   ) ,
//
//
//   );
// }
 
 
 
 
 
 
 
  }


import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/theme_helper.dart';
import 'package:m2m_flutter_main/pages/widgets/button.dart';
import 'package:m2m_flutter_main/themes.dart';
import 'widgets/input_field.dart';
import 'package:intl/intl.dart';
import '../common/Bottom_Bar.dart';
//import 'package:flutter/src/material/date_picker.dart';
class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _endTime ="9:30 PM";
  String _startTime =DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedColor=0;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.white,
 drawer: DrawerHelp(),
        //bottomNavigationBar: BottomBar(),
       
       appBar: AppBar(
          title: Text(
            "Meet Page",
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
            
          )
        ],
      ),
body: Container(
  padding: const EdgeInsets.only(left: 20,right: 20),
child: SingleChildScrollView(
  child:   Column(
  crossAxisAlignment: CrossAxisAlignment.start,
    children: [
  Text("Program Yarat",
  style:HeadingStyle ,
  ),
  
  MyInputField(title: "Title-Note",
  hint: "Enter your title"
  ),
  MyInputField(title: "Mentee name",
  hint: "Enter your note"
  ),
   MyInputField(title: "Mentee surname",
  hint: "Enter your mentee"
  ),
  
  MyInputField(title: "Date",
  hint: DateFormat.yMd().format( _selectedDate),
  widget: IconButton(
    icon:Icon(Icons.calendar_today_outlined),
    
    onPressed: () {
      _getDateFromUser() ;
    },
  ),
 
  ), 
   Row(
    children: [
      Expanded(
        child:MyInputField(
title: "StartDate",
hint: _startTime,
widget: IconButton(
  onPressed:(){
_getTimeFromUSer(isStartTime: true);
  } , 
  icon: Icon(
    Icons.access_time_rounded,
    
  ),
),
        ) ,
      ),
   SizedBox(width:12,),
   
      Expanded(
        child:MyInputField(
title: "End Date",
hint: _endTime,
widget: IconButton(
  onPressed:(){
_getTimeFromUSer(isStartTime: false);
  } , 
  icon: Icon(
    Icons.access_time_rounded,
    
  ),
),
        ) ,
      ),
    ],
  ),
    
    
    
    SizedBox(height:18 ,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment:CrossAxisAlignment.center ,
      children: [

_colorPalete(),
MyButton(label: "Create Task", onTap: ()=>null,)



    ],
    
    ),
    
    
    
    
    
    
    
    ],
  
  ),
),


)

    );
  }
_colorPalete(){
  return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  
  children: [
Text("Color",
style: subHeadingStyle,


),
SizedBox(height: 8.0,),
Wrap(
  children: List<Widget>.generate(
  3,(int index){
return GestureDetector(
onTap: () {
  setState(() {
    _selectedColor=index;
  });
  
},

  child:   Padding(
  
    padding: const EdgeInsets.only(right:8.0),
  
    child:   CircleAvatar (
    radius: 14,
    backgroundColor: index==0?MyThemes.primaryColor:index==1?MyThemes.primaryColor:Colors.pink,
  child: _selectedColor==index?Icon(Icons.done,
  color: Colors.white,
  size: 16,
  
  ):Container(

  ),
    
  
    ),
  
  ),
);
  }
)
)
],
);

}








_getDateFromUser() async {
  DateTime? _pickerDate = await showDatePicker(
    context: context, 
    initialDate: DateTime.now(), 
    firstDate: DateTime(2015),
     lastDate: DateTime(2122)
     );
     if(_pickerDate!=null){
      setState(() {
        _selectedDate=_pickerDate;
      });
      

     }
     else{

     }
}
_getTimeFromUSer({required bool isStartTime}) async {
 
 var pickedTime= await _showTimePicker();
 String _formatedTime =pickedTime.format(context);



if(pickedTime==null){
print("time cancel");
}else if(isStartTime==true){
setState(() {
  _startTime=_formatedTime;
});
}else if(isStartTime==false){
 setState(() {
   _endTime=_formatedTime;
 });

}

}


_showTimePicker(){
 return showTimePicker(
  initialEntryMode: TimePickerEntryMode.input,
  context: context,
   initialTime: TimeOfDay(
    hour: int.parse(_startTime.split(":")[0]),
    minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
    ),
    
    
    );
}
}
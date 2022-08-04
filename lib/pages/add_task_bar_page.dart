import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/theme_helper.dart';
import 'widgets/input_field.dart';
import 'package:intl/intl.dart';
import '../common/Bottom_Bar.dart';
import 'package:flutter/src/material/date_picker.dart';
class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _endTime ="9:30 PM";
  String _startTime =DateFormat("hh:mm a").format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 drawer: DrawerHelp(),
        bottomNavigationBar: BottomBar(),
       
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
  
  MyInputField(title: "Title",
  hint: "Enter your title"
  ),
  MyInputField(title: "Note",
  hint: "Enter your note"
  ),
   MyInputField(title: "Mente Name",
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
  )
    ],
  
  ),
),


)

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
  
});
}else if(isStartTime==false){
 setState(() {
   
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
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/theme_helper.dart';
import 'package:m2m_flutter_main/model/createMeetingRequest_model.dart';
import 'package:m2m_flutter_main/model/getMyMentees_model.dart';
import 'package:m2m_flutter_main/pages/widgets/button.dart';
import 'package:m2m_flutter_main/service/api_service.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
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
  Future<List<GetMyMenteesModel>?> futureGetMyMentesModel =
      APIService.getMyMentees();
  final menteeIdController = TextEditingController();
  final meetingDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final messageController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedColor = 0;
  List<String> items = [
    'post 1',
    'post 2 ',
    'post 3',
    'post 4',
  ];
  String? selectedItem = "Mentee Seçiniz.";
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
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Program Yarat",
                    style: HeadingStyle,
                  ),
                  MyInputField(
                      controller: messageController,
                      title: "Title-Note",
                      hint: "Enter your title"),
                  Text(
                    "Mentee",
                    style: subHeadingStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3, 30, 5, 2),
                    child: Container(
                      width: 1200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(color: MyThemes.primaryColor),
                      ),
                      child: FutureBuilder<List<GetMyMenteesModel>?>(
                          future: futureGetMyMentesModel,
                          builder: (context, i) {
                            return ListView.builder(
                                itemCount: i.data?.length,
                                itemBuilder: (context, index) {
                                  //var containers=  tasks.map((tasks)=> Container(
                                  // height: 90,
                                  // width: 50,
                                  // margin: EdgeInsets.all(5),
                                  //   color: MyThemes.primaryColor,child: Text(tasks))).toList()
                                  //   child: Padding( padding:EdgeInsets.all(8),
                                  return DropdownButtonFormField<String>(
                                      isExpanded: true,
                                      dropdownColor: Colors.white,

                                      // underline: Container(),
                                      value: selectedItem,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedItem = newValue!;
                                        });
                                      },
                                      items: i.data?[index].myMenteesName<
                                              List<GetMyMenteesModel>?>
                                          .toList());
                                });
                          }),
                    ),
                  ),
                  MyInputField(
                    controller: meetingDateController,
                    title: "Date",
                    hint: DateFormat.yMd().format(_selectedDate),
                    widget: IconButton(
                      icon: Icon(Icons.calendar_today_outlined),
                      onPressed: () {
                        _getDateFromUser();
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyInputField(
                          controller: startTimeController,
                          title: "StartDate",
                          hint: _startTime,
                          widget: IconButton(
                            onPressed: () {
                              _getTimeFromUSer(isStartTime: true);
                            },
                            icon: Icon(
                              Icons.access_time_rounded,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: MyInputField(
                          controller: endTimeController,
                          title: "End Date",
                          hint: _endTime,
                          widget: IconButton(
                            onPressed: () {
                              _getTimeFromUSer(isStartTime: false);
                            },
                            icon: Icon(
                              Icons.access_time_rounded,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _colorPalete(),
                      MyButton(
                        label: "Create Task",
                        onTap: () async {
                          int? currentUserId =
                              await SharedService.loginDetails();
                          CreateMeetingRequestModel model =
                              CreateMeetingRequestModel(
                                  menteeId: 2,
                                  meetingDate: meetingDateController.text,
                                  startTime: startTimeController.text,
                                  endTime: endTimeController.text,
                                  message: messageController.text);
                          APIService.createMeeting(currentUserId!, model)
                              .then((response) => null);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _colorPalete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: subHeadingStyle,
        ),
        SizedBox(
          height: 8.0,
        ),
        Wrap(
            children: List<Widget>.generate(3, (int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: 14,
                backgroundColor: index == 0
                    ? MyThemes.primaryColor
                    : index == 1
                        ? MyThemes.primaryColor
                        : Colors.pink,
                child: _selectedColor == index
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 16,
                      )
                    : Container(),
              ),
            ),
          );
        }))
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2122));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {}
  }

  _getTimeFromUSer({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.parse;
    if (pickedTime == null) {
      print("time cancel");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
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

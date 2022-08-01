//import 'dart:ffi';

import 'dart:html';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../pages/main_page.dart';
import '../pages/mentee_page.dart';
import '../pages/mentor_page.dart';


class ListDisplay extends StatefulWidget {
  const ListDisplay({Key? key}) : super(key: key);

  @override
  State<ListDisplay> createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
   TextEditingController editingController = TextEditingController();
   final duplicateItems = List<String>.generate(10000, (i) => "Eleman $i");
 
 List<String> list = [];
  void initState() {
    list.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        list.clear();
        list.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        list.clear();
        list.addAll(duplicateItems);
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
             //searchbar için gerekli
         Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Sınavı olduğun tarihi yaz",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ),
            
          SizedBox(height: 30),
          new Expanded(
         
            child: ListView.builder(
              
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    //***normalde tıklandığında profil sayfasına gidecek ama daha oluşturulmadı.***
                    onTap: () =>  Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>MainPage())),
                    title: Text('Listedeki ${list[index]}'),
                    

                  );
                },
              ),
        )
        ],    
       ),
    );
  }
 }

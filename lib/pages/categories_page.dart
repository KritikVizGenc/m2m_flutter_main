import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/model/getAllTags_model.dart';
import 'package:m2m_flutter_main/model/getById_model.dart';
import 'package:m2m_flutter_main/service/api_service.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import '../common/Bottom_Bar.dart';
import '../common/drawer.dart';
import '../service/shared_service.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  // Future<List<GetAllTagsModel>?> futureTagsModel = APIService.getAllTags();

  int? selectedChip;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerHelp(),
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: false,
      ),
      // body:  FutureBuilder<List<GetAllTagsModel>?>(
      //   future: futureTagsModel,
      //   builder: (context, i) {
      //     if (i.hasData) {
      //       if(i.data != null && i.data!.isNotEmpty) {
      //         return Wrap(
      //             children: List.generate(i.data!.length, (index) =>
      //                 GestureDetector(
      //                   onTap: () {
      //                     setState(() {
      //                       selectedChip = i.data?[index].id;
      //                     });
      //                   },
      //                   child: Padding(
      //                     padding: const EdgeInsets.all(6.0),
      //                     child: _buildChip(
      //                         '${i.data?[index].tagName}', Colors.purple),
      //                   ),
      //                 ),
      //             )
      //         );
      //       }

      //     } else if (i.hasError) {
      //       return Text('${i.error}');
      //     }

      //     // By default, show a loading spinner.
      //     return const CircularProgressIndicator();
      //   },
      // ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
    );
  }
}

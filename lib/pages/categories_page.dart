import 'package:flutter/material.dart';

import '../common/Bottom_Bar.dart';
import '../common/drawer.dart';

class CategoriesPage extends StatefulWidget {
  @override
    _CategoriesPageState createState() => _CategoriesPageState();
}


class _CategoriesPageState extends State<CategoriesPage> {





  @override
  Widget build(BuildContext context) {
    List<String> categoryList = <String>[];
    categoryList.add("PHP");
    categoryList.add("HTML");
    categoryList.add("CSS");
    categoryList.add("JAVASCRIPT");
    categoryList.add("FLUTTER");
    categoryList.add("KOTLIN");
    categoryList.add("JAVA");
    categoryList.add("SWIFT");
    categoryList.add("PYTHON");
    categoryList.add("LINUX");
    categoryList.add("DATABASE MANAGEMENT");

    

    return Scaffold(
      drawer: DrawerHelp(),
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: false,
      ),
      body: Center(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 65,

                crossAxisSpacing: 5,
                mainAxisSpacing: 0),
            itemCount: categoryList.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                child: _buildChip(categoryList[index], Colors.purple),
              );
            }),

      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(2.0),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }

}


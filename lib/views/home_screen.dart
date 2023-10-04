import 'package:example_app/controllers/home_controller.dart';
import 'package:example_app/models/list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'components/list_item.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
   final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      backgroundColor: Colors.blueGrey.shade800,
      title: Text("Katılımcı Listesi",
          style:TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Colors.white
          )),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {Get.back();},
      ),

    ),
      body:  PagedListView<int, Data>(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<Data>(
          itemBuilder: (context, item, index) => ListItem(
            title: item.firstName.toString(), about: item.lastName.toString(),
          ),
        ),
      )
    );
  }
}

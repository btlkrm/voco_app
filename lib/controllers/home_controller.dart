import 'dart:convert';

import 'package:example_app/services/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../models/list_model.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  int page=1;
  int  pageSize = 6;

  final PagingController<int, Data> pagingController =
  PagingController(firstPageKey: 1);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    // TODO: implement onInit
    super.onInit();

  }
  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await getAllList(pageKey);
      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey +1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<List<Data>> getAllList(page) async {
    List<Data> items = [];
    String data = await Service.getAllList(page);
    try{
      isLoading(true);
      if(data!=null){
        var model=json.decode(data) ;
        items= List<Data>.from(model['data']?.map((p) => Data.fromJson(p))).toList();
        return items;

      }
    }
    finally{
      isLoading(false);

    }
    update();
    return items;
  }



}
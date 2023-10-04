import 'dart:convert';

import 'package:example_app/models/login_request_model.dart';
import 'package:example_app/models/login_success_model.dart';
import 'package:example_app/models/login_unsuccess_model.dart';
import 'package:example_app/services/pref_service.dart';
import 'package:example_app/services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController
  emailLoginController,passLoginController;
  final loginFormKey=GlobalKey<FormState>();
  final loginRequestModel=LoginRequestModel();
  final pref=PrefService();
  final loginSuccessModel=LoginSuccessModel();
  var isLoading=false.obs;

  @override
  void onInit() {
    emailLoginController=TextEditingController();
    passLoginController=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }


  @override
  void dispose() {
    passLoginController.dispose();
    emailLoginController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void login() async {
    loginRequestModel.email =emailLoginController.text.trim(); //emailLoginController.text.trim();
    loginRequestModel.password=passLoginController.text.trim();//passLoginController.text.trim();
    isLoading(true);
    String data="";
    try{
      data = await Service.login(
          loginRequestModel: loginRequestModel);

      var jsonResponse=json.decode(data);

      if(jsonResponse.containsKey("token")){
        var model=json.decode(data);
        var myToken=model["token"].toString();
        pref.createString("token", myToken);

      }
        else{
          var model=json.decode(data);
          var errorDetails=model["error"].toString();
          Get.snackbar("Hata".tr,errorDetails);
        }
    }
    catch(e){
      Get.snackbar("Hata".tr, "Beklenmeyen Hata");
    }
    finally{
      isLoading(false);
    }
  }
}
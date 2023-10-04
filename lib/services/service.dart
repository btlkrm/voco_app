import 'dart:convert';

import 'package:example_app/models/login_request_model.dart';
import 'package:example_app/models/login_success_model.dart';
import 'package:example_app/services/pref_service.dart';
import 'package:http/http.dart' as http;

import '../app_config.dart';
import '../models/list_model.dart';
class Service{
  final box=PrefService();
  static  Future<String>  login({required LoginRequestModel loginRequestModel}) async {
    String data="";
    var headers = { 'Content-Type': 'application/json'};
    var url = Uri.parse('$baseUrl/api/login');
    var body = json.encode(loginRequestModel);
    var response = await http.post(url, body: body,
        headers:headers);
    var jsonData =response.body.toString();

    if (response.statusCode == 200 ||response.statusCode == 400) {
      data=response.body.toString();
      //model=json.decode(response.body.toString());
    }
    else {
      data=response.reasonPhrase.toString();
    }
    return data;
  }

  static Future<String>getAllList(int page) async{

    var headers = {
      'Content-Type': 'application/json',
    };
    var response=
    await http.get(Uri.parse('$baseUrl/api/users?page=$page'),
        headers: headers);

    if (response.statusCode == 200) {
     var data=response.body.toString();
     return data;
      //model=json.decode(response.body.toString());
    }
    else {
      return throw Exception("Listeye Erişilemedi");
    }
  }

}
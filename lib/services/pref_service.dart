import 'package:shared_preferences/shared_preferences.dart';

class PrefService{
  Future createString(String key,String value) async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    _pref.setString(key, value);
  }
  Future readString(String key)async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    var cache=_pref.getString(key) ??'';
    return cache;
  }
  Future createBool(String key,bool value) async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    _pref.setBool(key, value);
  }
  Future readBool(String key)async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    var cache=_pref.getBool(key) ??'';
    return cache;
  }
}

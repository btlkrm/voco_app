import 'package:example_app/services/pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final pref=PrefService();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages:AppRoutes.routes,
      initialRoute:
      pref.readString("token")==null?Routes.loginScreen:Routes.homeScreen,

    );
  }
}



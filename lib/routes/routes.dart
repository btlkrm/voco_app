import 'package:example_app/bindings/home_binding.dart';
import 'package:get/get.dart';

import '../bindings/login_binding.dart';
import '../views/home_screen.dart';
import '../views/login_screen.dart';

class AppRoutes{
  static final routes=[
    GetPage(name: Routes.loginScreen, page: ()=> LoginScreen(),binding: LoginBindings()),
    GetPage(name: Routes.homeScreen, page:()=> HomeScreen(),binding: HomeBindings()),
  ];
}
class Routes{
  static const loginScreen='/loginScreen';
  static const homeScreen='/homeScreen';

}
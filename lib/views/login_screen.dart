import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../reqex_helper.dart';
import '../routes/routes.dart';
import 'components/my_button.dart';
import 'components/my_text_field.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
   // text editing controllers
   final LoginController controller = Get.put(LoginController());


   // sign user in method
   void signUserIn() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child:SingleChildScrollView(
            child:  Column(
              children: [
                SizedBox(height: 50,),
                Icon(Icons.lock_outline_rounded,size: 100,),
                SizedBox(height: 50,),
                Text("LOGIN",style: TextStyle(color: Colors.grey.shade700,fontSize: 20,fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 25,),
                MyTextField(
                  controller: controller.emailLoginController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: controller.passLoginController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap:(){

                    if(!RegExp(validationEmail).hasMatch(controller.emailLoginController.text!)){
                     return  Fluttertoast.showToast(gravity: ToastGravity.CENTER,
                          msg: 'Geçersiz email!');

                    }
                    if(controller.passLoginController.text.trim().length<=0) {
                       return Fluttertoast.showToast(gravity: ToastGravity.CENTER,
                   msg: 'Şifre Boş Olamaz!');

                  }
                    controller.login();
                    Get.offNamed(Routes.homeScreen);

                  }

                ),

                const SizedBox(height: 50),


              ],
            ),
          )
        ),
      ),
    );
  }
}

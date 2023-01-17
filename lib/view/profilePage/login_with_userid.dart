import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoping_apps_test/RouteManage/routes.dart';
import 'package:shoping_apps_test/model/login_user_input.dart';
import 'package:shoping_apps_test/view/android_main_page.dart';

import '../../Reepository/product_repository.dart';
import '../../Utils/contance.dart';
import '../../model/authmodel.dart';

class LoginWithUserID extends StatefulWidget {
  const LoginWithUserID({Key? key}) : super(key: key);

  @override
  State<LoginWithUserID> createState() => _LoginWithUserIDState();
}

class _LoginWithUserIDState extends State<LoginWithUserID> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  var state;

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 100,
                    width: 100,
                    image: AssetImage("assets/images/monarch_mart.png")),
                DInput(
                  controller: emailcontroller,
                  hint: 'Enter Your Email',
                 
                ),
                DView.spaceHeight(),
                DInput(
                  controller: passwordcontroller,
                  hint: 'Enter Your Password',
                 
                ),
                DView.spaceHeight(),
                ElevatedButton(
                    onPressed: () async {
                      loginToMainPage();
                    },
                    child: const Text("Login")),
                DView.spaceHeight(),
                ElevatedButton(
                    onPressed: () async {
                      createAccount();
                    },
                    child: Text("Create Account"))
              ],
            ),
          )
        ],
      ),
    ));
  }

  Future<void> loginToMainPage() async {
    if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
      var loginUserInput = LoginUserInput(
          email: emailcontroller.text, password: passwordcontroller.text);
      AuthModel response =
          await ProductRepositories().signinData(loginUserInput);
      if (response.success == true) {
        state = response;
        final SharedPreferences db = await prefs;
        db.setString("uid", response.data!.userid.toString());
        db.setString("name", response.data!.fullname.toString());
        db.setString("email", response.data!.email.toString());
        print("data is here i am seeing:${state.success}");
        if (state.success == true) {
          Fluttertoast.showToast(msg: "Login successfully");
          Get.off(AndroidMainPage());
        } else {
          Fluttertoast.showToast(msg: "User not found");
        }
      }
    } else {
      Fluttertoast.showToast(msg: "Filed is empty");
    }
  }

  void createAccount() {
    Get.toNamed(Routes.createAccount);
  }
}

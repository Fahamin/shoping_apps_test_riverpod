import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoping_apps_test/RouteManage/routes.dart';
import 'package:shoping_apps_test/Utils/colors.dart';
import 'package:shoping_apps_test/view/android_main_page.dart';

import '../../Reepository/product_repository.dart';
import '../../Utils/contance.dart';
import '../../model/authmodel.dart';
import '../../model/signup_user_input.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var emialcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var confimcontroller = TextEditingController();
  var state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(15))),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      top: 20,
                      left: 1,
                      right: 1,
                      child: Image(
                          height: 100,
                          width: 100,
                          image: AssetImage("assets/images/monarch_mart.png")),
                    ),

                    // this is backbutton
                    Positioned(
                      top: 20,
                      left: 10,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Appcolors.scaffoldBGColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DView.spaceHeight(100),
                          Text(
                            Routes.createAccount,
                            style: TextStyle(color: Appcolors.scaffoldBGColor),
                          ),
                          DView.spaceHeight(),
                          DInput(
                            controller: namecontroller,
                            hint: 'Enter Your Name',
                          ),
                          DView.spaceHeight(),
                          DInput(
                            controller: phonecontroller,
                            hint: 'Enter Your Pone',
                          ),
                          DView.spaceHeight(),
                          DInput(
                            controller: emialcontroller,
                            hint: 'Enter Your Email',
                          ),
                          DView.spaceHeight(),
                          DInput(
                            controller: passwordcontroller,
                            hint: 'Enter Your Password',
                          ),
                          DView.spaceHeight(),
                          DInput(
                            controller: confimcontroller,
                            hint: 'Confirm Password',
                          ),
                          DView.spaceHeight(),
                          ElevatedButton(
                              onPressed: () => singUp(), child: Text("SingUP")),
                          DView.spaceHeight(),
                          ElevatedButton(
                              onPressed: () => haveAccount(),
                              child: Text("Already Have Account"))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  haveAccount() {
    Get.toNamed(Routes.loginWithUserID);
  }

  singUp() async {
    if (confimcontroller.text.isEmpty ||
        passwordcontroller.text.isEmpty ||
        namecontroller.text.isEmpty ||
        phonecontroller.text.isEmpty ||
        emialcontroller.text.isEmpty) {
      Fluttertoast.showToast(msg: "Filed is empty");
    } else {
      if (passwordcontroller.text == confimcontroller.text) {
        var ff = DateTime.now().millisecondsSinceEpoch.toString();
        var dd = DateTime.now()
            .toString()
            .split(" ")[0]
            .split("-")
            .join()
            .toString();

        var result = ff + dd;
        var signupUserInput = SignupUserInput(
            userid: result.toString(),
            fullname: namecontroller.text.toString(),
            email: emialcontroller.text.toString(),
            phone: phonecontroller.text.toString(),
            password: passwordcontroller.text.toString(),
            gender: "no need",
            address: "no need",
            country: "country",
            city: "city",
            pincode: "pincode");

        AuthModel response =
            await ProductRepositories().signupData(signupUserInput);
        if (response.success == true) {
          state = response;
          final SharedPreferences db = await prefs;
          db.setString("uid", response.data!.userid.toString());
          db.setString("name", response.data!.fullname.toString());
          db.setString("email", response.data!.email.toString());
          if (state.success == true) {
            Fluttertoast.showToast(msg: "sign-up successfully");
            Get.off(AndroidMainPage());
          } else {
            Fluttertoast.showToast(msg: "User already exits");
          }
        }
        namecontroller.text = "";
        emialcontroller.text = "";
        passwordcontroller.text = "";
        phonecontroller.text = "";
        confimcontroller.text = "";
      } else {
        Fluttertoast.showToast(msg: "password not match");
      }
    }
  }
}

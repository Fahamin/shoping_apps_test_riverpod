import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoping_apps_test/RouteManage/routes.dart';
import 'package:shoping_apps_test/view/android_main_page.dart';

import '../Utils/contance.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      final SharedPreferences db = await prefs;

      var userID = db.getString("uid");
      if (userID != null) {
        Get.toNamed(Routes.androidMainPage);
      } else {
        Get.toNamed(Routes.loginWithUserID);
      }
    });
    return Scaffold(
      body: Center(
        child: DView.loadingCircle(),
      ),
    );
  }
}

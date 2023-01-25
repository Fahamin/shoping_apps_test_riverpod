import 'package:d_view/d_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoping_apps_test/view/profilePage/profilecomponent/profile_more_settings.dart';
import 'package:shoping_apps_test/view/profilePage/profilecomponent/profile_view.dart';
import 'package:shoping_apps_test/view/profilePage/profilecomponent/setting_option.dart';

import '../../Utils/colors.dart';
import '../../Utils/string.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            )),
        elevation: 0.0,
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Appcolors.primaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            ProfileView(),
            DView.spaceHeight(),

            //Setting option
            SettingOption(),

            //more settings text

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                AppString.moreSettings,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),

            //more settings listtile
            ProfileMoreSettings(),
          ],
        ),
      ),
    );
  }
}

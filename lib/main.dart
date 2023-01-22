import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shoping_apps_test/RouteManage/routes.dart';

import 'Utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Try Ecommerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: Appcolors.scaffoldBGColor,
        primaryColor: Appcolors.primaryColor,
        fontFamily: "Roboto",
      ),
      initialRoute: Routes.splashScreen,
      getPages: appRoutes(),
    );
  }
}

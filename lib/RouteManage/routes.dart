import 'package:get/get.dart';
import 'package:shoping_apps_test/view/android_main_page.dart';
import 'package:shoping_apps_test/view/login_with_userid.dart';
import 'package:shoping_apps_test/view/splash_scren.dart';

import '../view/create_account.dart';

class Routes {
  static String splashScreen = '/splashScreen';

  static String androidMainPage = '/androidMainPage';

  static String loginWithUserID = '/loginWithUserID';
  static String createAccount = '/createAccount';
}

appRoutes() => [
      GetPage(name: Routes.androidMainPage, page: () => AndroidMainPage()),
      GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
      GetPage(name: Routes.createAccount, page: () => CreateAccount()),
      GetPage(name: Routes.loginWithUserID, page: () => LoginWithUserID())
    ];

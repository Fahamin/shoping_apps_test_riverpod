import 'package:get/get.dart';
import 'package:shoping_apps_test/view/android_main_page.dart';
import 'package:shoping_apps_test/view/cardPage/card_page.dart';
import 'package:shoping_apps_test/view/categoryPage/category_page.dart';
import 'package:shoping_apps_test/view/detailsPage/details_page.dart';
import 'package:shoping_apps_test/view/homePage/home_page.dart';
import 'package:shoping_apps_test/view/productPage/product_page.dart';
import 'package:shoping_apps_test/view/splash_scren.dart';

import '../view/profilePage/create_account.dart';
import '../view/profilePage/login_with_userid.dart';

class Routes {
  static String splashScreen = '/splashScreen';

  static String androidMainPage = '/androidMainPage';

  static String loginWithUserID = '/loginWithUserID';

  static String createAccount = '/createAccount';

  static String cardPage = '/cardPage';

  static String categoryPage = '/categoryPage';

  static String detailsPage = '/detailsPage';

  static String homePage = '/homePage';

  static String productPage = '/productPage';
}

appRoutes() => [
      GetPage(
        name: Routes.androidMainPage,
        page: () => AndroidMainPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
      GetPage(
        name: Routes.createAccount,
        page: () => CreateAccount(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.loginWithUserID,
        page: () => LoginWithUserID(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.cardPage,
        page: () => CardPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.categoryPage,
        page: () => CategoryPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.detailsPage,
        page: () => DetailsPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.homePage,
        page: () => HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.productPage,
        page: () => ProductPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      )
    ];

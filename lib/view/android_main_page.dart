import 'package:flutter/material.dart';
import 'package:shoping_apps_test/Utils/botom_nav_bar.dart';
import 'package:shoping_apps_test/view/cardPage/card_page.dart';
import 'package:shoping_apps_test/view/categoryPage/category_page.dart';
import 'package:shoping_apps_test/view/homePage/home_page.dart';
import 'package:shoping_apps_test/view/productPage/product_page.dart';
import 'package:shoping_apps_test/view/profilePage/profile_page.dart';

const List _page = [
  HomePage(),
  CategoryPage(),
  ProductPage(),
  CardPage(),
  ProfilePage()
];

class AndroidMainPage extends StatefulWidget {
  const AndroidMainPage({Key? key}) : super(key: key);

  @override
  State<AndroidMainPage> createState() => _AndroidMainPageState();
}

class _AndroidMainPageState extends State<AndroidMainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomMenu(
        selectedIndex: _selectedIndex,
        onClicked: _onItemTapped,
      ),
      body: Center(
        child: _page.elementAt(_selectedIndex),
      ),
    );
  }
}



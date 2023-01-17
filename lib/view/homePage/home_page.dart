import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:shoping_apps_test/view/homePage/homePageComponent/search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DView.spaceHeight(),
              SearchPage(),
            ],
          ),
        ),
      ),
    );
  }
}

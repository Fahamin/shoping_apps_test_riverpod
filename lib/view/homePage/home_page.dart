import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:shoping_apps_test/Utils/colors.dart';
import 'package:shoping_apps_test/view/homePage/homePageComponent/search_field.dart';

import '../../Reepository/product_repository.dart';
import '../../model/home_page_image.dart';
import 'homePageComponent/all_product.dart';
import 'homePageComponent/carousel.dart';
import 'homePageComponent/discount_banner.dart';
import 'homePageComponent/option_list.dart';
import 'homePageComponent/top_category_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DView.spaceHeight(),
                SearchFiled(),
                DView.spaceHeight(),
                CarouselSlider(),
                DView.spaceHeight(),
                OptionList(),
                DView.spaceHeight(),
                TopCategoryList(),
                DView.spaceHeight(),
                DiscountBanner(),
                DView.spaceHeight(),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "On sale Products",
                    style: TextStyle(color: Appcolors.primaryColor),
                  ),
                ),
                AllProduct()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

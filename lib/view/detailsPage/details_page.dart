import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoping_apps_test/Utils/colors.dart';
import 'package:shoping_apps_test/view/cardPage/card_page.dart';
import 'package:shoping_apps_test/view/detailsPage/detailsPageComponent/product_image_view.dart';

import '../../model/add_to_cart_model.dart';
import '../../model/product_model.dart';
import 'detailsPageComponent/add_to_cart_buy_now.dart';
import 'detailsPageComponent/brand_sku_size.dart';
import 'detailsPageComponent/summary.dart';
import 'detailsPageComponent/title_rating_price.dart';

class DetailsPage extends StatelessWidget {
  Data product;

  DetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(CardPage());
              },
              child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Appcolors.primaryColor,
                  )),
            ),
            DView.spaceHeight(),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageView(
                    image: product.images,
                    discount: product.discount,
                  ),
                  DView.spaceHeight(),
                  TitleRatingPrice(
                    price: product.price.toString(),
                    product_title: product.title.toString(),
                    rating: product.rating.toString(),
                  ),
                  DView.spaceHeight(),
                  BrandSKUSize(
                    stock: product.stock.toString(),
                  ),
                  DView.spaceHeight(),
                  Visibility(
                      visible: true,
                      child: Summary(
                        description: product.thumdescription.toString(),
                      ))
                ],
              )),
            ),
            AddToCartAndBuyNow(
              addToCartModel: AddToCartModel(
                  title: product.title.toString(),
                  image: product.thumimage.toString(),
                  price: product.price.toString()),
            )
          ],
        ));
  }
}

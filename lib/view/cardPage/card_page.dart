import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/string.dart';
import '../profilePage/checkout_page.dart';
import 'cardPageComponent/card_profile_appbar.dart';
import 'cardPageComponent/cart_handler_provider.dart';
import 'cardPageComponent/single_card_product.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CardProfileAppBar(
                  title: Text(
                "Your Card",
                style: TextStyle(color: Appcolors.primaryColor),
              )),
              Expanded(child: SingleCardProduct()),
              DView.spaceHeight(),
              Container(
                height: 30,
                decoration: const BoxDecoration(
                  color: Appcolors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          AppString.totalAmount,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer(
                          builder: (context, ref, child) {
                            final total = ref.watch(totalAmoutn);
                            return Text(
                              " ৳ $total",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                      ),
                    ]),
              ),
              DView.spaceHeight(),
              Consumer(
                builder: (context, ref, child) {
                  return GestureDetector(
                    onTap: () {
                      if (ref.watch(totalAmoutn) > 10) {
                        // here is checkout page
                            Get.to(Checkout());
                      } else {
                        Fluttertoast.showToast(msg: "Increase you Price");
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration:
                          const BoxDecoration(color: Appcolors.primaryColor),
                      child: const Center(
                          child: Text(
                        AppString.proceedToOrder,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

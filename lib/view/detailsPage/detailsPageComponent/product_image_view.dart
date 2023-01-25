import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:shoping_apps_test/view/detailsPage/detailsPageComponent/carousel_slider.dart';

import '../../../Utils/colors.dart';

class ProductImageView extends StatelessWidget {
  final List<String>? image;
  final discount;

  const ProductImageView(
      {super.key, required this.image, required this.discount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Column(mainAxisSize: MainAxisSize.min, children: [
          Center(
              child: CarouselSlider(
            image: image,
          )),
          const Divider(
            color: Colors.grey,
            thickness: 2,
            height: 2,
          ),
          DView.spaceHeight(),
        ]),
        Positioned(
            bottom: 0,
            left: 10,
            child: Container(
              height: 25,
              width: 45,
              decoration: BoxDecoration(
                  color: Appcolors.primaryColor,
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                  child: Text(
                "${discount.toString()}%",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ))
      ]),
    );
  }
}

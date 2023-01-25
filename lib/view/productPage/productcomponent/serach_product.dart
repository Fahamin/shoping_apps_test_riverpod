import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoping_apps_test/view/detailsPage/details_page.dart';
import 'package:shoping_apps_test/view/productPage/productcomponent/serarch_product_handler.dart';

import '../../../Utils/colors.dart';

//this widget Common widget of AndroidHomepage and AndroidProductPage

class SearchProductData extends StatelessWidget {
  const SearchProductData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DView.spaceHeight(),
        Consumer(
          builder: (context, ref, child) {
            final searchdata = ref.watch(searchUservalueProvider);
            final data =
                ref.watch(searchProductProvider(searchdata.toString()));
            return data.when(
              error: (error, stacktrace) {
                return const Text("Error");
              },
              loading: () => const CircularProgressIndicator(),
              data: (product) {
                product.data!.shuffle();

                return product.data!.length == 0
                    ? Text("Data Not found")
                    : GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: product.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            childAspectRatio:
                                MediaQuery.of(context).size.width < 360
                                    ? 5 / 9
                                    : 5 / 7),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          product: product.data![index])));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(product
                                                    .data![index].thumimage
                                                    .toString())),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                style: BorderStyle.solid)),
                                      ),
                                      DView.spaceHeight(),
                                      SizedBox(
                                        width: 130,
                                        child: Text(
                                          product.data![index].title.toString(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      DView.spaceHeight(),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                " ৳${product.data![index].price.toString()}",
                                            style: const TextStyle(
                                                decorationColor:
                                                    Appcolors.primaryColor,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationStyle:
                                                    TextDecorationStyle.solid,
                                                color: Colors.black)),
                                        TextSpan(
                                            text:
                                                " ৳${product.data![index].price.toString()}",
                                            style: const TextStyle(
                                                color: Appcolors.primaryColor))
                                      ]))
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: (150 / 2) - 40,
                                    left: 20,
                                    child: Container(
                                      height: 25,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          color: Appcolors.primaryColor,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(8),
                                              topRight: Radius.circular(8))),
                                      child: Center(
                                        child: Text(
                                          "${product.data![index].discount}%",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          );
                        });
              },
            );
          },
        ),
      ],
    );
  }
}

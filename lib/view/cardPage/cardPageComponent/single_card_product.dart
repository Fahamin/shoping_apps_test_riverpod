import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoping_apps_test/Reepository/product_repository.dart';
import 'package:shoping_apps_test/view/cardPage/cardPageComponent/cart_handler_provider.dart';
import 'package:shoping_apps_test/view/cardPage/cardPageComponent/chart_handler.dart';

import '../../../Utils/colors.dart';
import 'card_button.dart';

class SingleCardProduct extends StatelessWidget {
  const SingleCardProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final cartprovider = ref.watch(cartProvider);
      return cartprovider.when(
          error: (error, starTrace) => Text("Error"),
          loading: () => Center(
                child: CircularProgressIndicator(),
              ),
          data: (cartdata) {
            return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: cartdata.data!.items!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    height: 150,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartdata.data!.items![index].title
                                          .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        color: Colors.black,
                                      ),
                                    ),
                                    DView.spaceHeight(),
                                    Text(
                                      "৳ ${cartdata.data!.items![index].price}",
                                      style: const TextStyle(
                                          color: Appcolors.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    DView.spaceHeight(5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Consumer(
                                            builder: (contex, ref, child) =>
                                                InkWell(
                                                  onTap: () {
                                                    if (ref.watch(
                                                            quantity(index)) <
                                                        5) {
                                                      ref
                                                          .read(quantity(index)
                                                              .notifier)
                                                          .state++;

                                                      ref
                                                          .read(totalAmoutn
                                                              .notifier)
                                                          .state = ref
                                                              .read(totalAmoutn
                                                                  .notifier)
                                                              .state +
                                                          (1 *
                                                              int.parse(cartdata
                                                                  .data!
                                                                  .items![index]
                                                                  .price
                                                                  .toString()));
                                                    }
                                                  },
                                                  child: CardButton(
                                                    bodercolor: Colors.black26,
                                                    icondata: (Icons.add),
                                                  ),
                                                )),
                                        Text(
                                          ref.watch(quantity(index)).toString(),
                                          style: const TextStyle(
                                              color: Appcolors.primaryColor),
                                        ),
                                        Consumer(
                                          builder: (context, ref, child) {
                                            return InkWell(
                                              onTap: () {
                                                if (ref.watch(quantity(index)) >
                                                    1) {
                                                  ref
                                                      .read(quantity(index)
                                                          .notifier)
                                                      .state--;

                                                  ref
                                                      .read(
                                                          totalAmoutn.notifier)
                                                      .state = ref
                                                          .read(totalAmoutn
                                                              .notifier)
                                                          .state -
                                                      (1 *
                                                          int.parse(cartdata
                                                              .data!
                                                              .items![index]
                                                              .price
                                                              .toString()));
                                                }
                                              },
                                              child: const CardButton(
                                                bodercolor: Colors.black26,
                                                icondata: (Icons.remove),
                                              ),
                                            );
                                          },
                                        ),
                                        InkWell(
                                          onTap: () {
                                            ProductRepositories()
                                                .removeCartData(cartdata.data!
                                                    .items![index].cartitemid
                                                    .toString());
                                            ref.refresh(cartProvider);
                                          },
                                          child: CardButton(
                                            bodercolor: Appcolors.primaryColor,
                                            icondata: (Icons.delete),
                                            iconcolor: Appcolors.primaryColor,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                });
          });
    });
  }
}

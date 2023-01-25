import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoping_apps_test/view/productPage/productcomponent/checkVisibility_provider.dart';
import 'package:shoping_apps_test/view/productPage/productcomponent/search_card.dart';
import 'package:shoping_apps_test/view/productPage/productcomponent/serach_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: const [
              SearchaProduct(),
              Expanded(child: SingleChildScrollView(child: SearchProductData()))
            ],
          ),
          Positioned(
              top: 82,
              right: 0,
              child: Consumer(
                builder: (context, ref, child) {
                  final checkVisible = ref.watch(checkvisibilityStateProvider);
                  return Visibility(
                    visible: checkVisible,
                    child: Container(
                      color: Colors.red,
                      width: 160,
                      height: 200,
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: const Text("prize sort"))
                        ],
                      ),
                    ),
                  );
                },
              ))
        ]),
      ),
    );

  }
}

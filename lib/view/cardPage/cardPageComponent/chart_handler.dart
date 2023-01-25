import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoping_apps_test/Reepository/product_repository.dart';
import 'package:shoping_apps_test/model/cartmodel.dart';

import 'cart_handler_provider.dart';

final cartProvider = FutureProvider.autoDispose<CartModel>((ref) async {
  ProductRepositories productRepositories = ProductRepositories();
  int sum = 0;
  CartModel cartModel = await productRepositories.getCartData();

  for (int i = 0; i < cartModel.data!.items!.length; i++) {
    sum += int.parse(cartModel.data!.items![i].price.toString());
  }
  ref.read(totalAmoutn.notifier).state = sum;
  return await productRepositories.getCartData();
});

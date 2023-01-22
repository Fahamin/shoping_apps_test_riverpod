import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoping_apps_test/Reepository/product_repository.dart';
import 'package:shoping_apps_test/model/product_model.dart';

final productProvider = FutureProvider.autoDispose<ProductModel>((ref) async {
  ProductRepositories productRepositories = ProductRepositories();
  return await productRepositories.getProductData();

});

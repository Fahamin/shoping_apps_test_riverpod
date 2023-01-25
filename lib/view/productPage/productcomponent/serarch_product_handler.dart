import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Reepository/product_repository.dart';
import '../../../model/product_model.dart';

final searchProductProvider =
    FutureProvider.autoDispose.family<ProductModel, String>((ref, value) async {
  ProductRepositories productRepositories = ProductRepositories();
  if (value.isEmpty || value.length == 0) {
    return await productRepositories.getProductData();
  }
  return await productRepositories.getSearchProduct(value.toLowerCase());
});

final searchUservalueProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});

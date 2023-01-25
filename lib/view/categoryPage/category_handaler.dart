import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Reepository/product_repository.dart';
import '../../model/categorymodel.dart';

final categoryProvider = FutureProvider.autoDispose<CategoryModel>((ref) async {
  ProductRepositories productRepositories = ProductRepositories();
  return await productRepositories.getCategoryData();
});

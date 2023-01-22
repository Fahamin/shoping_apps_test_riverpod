import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Reepository/product_repository.dart';
import '../../../model/home_page_image.dart';

final homepageApiProvider =
    FutureProvider.autoDispose<HomePageImageModel>((ref) async {
  ProductRepositories productRepositories = ProductRepositories();
  return await productRepositories.getHomeimageData();
});

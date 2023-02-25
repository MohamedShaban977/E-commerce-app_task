import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/carts/data/tables/product_cart_table.dart';
import '../../features/wishlist/data/tables/product_favorite_table.dart';

class HiveHelper {
  static late Box<dynamic> cartProductDB;
  static late Box<dynamic> favoritesProductDB;
  static const _cartProductBoxDB = 'cartProductBox';
  static const _favoriteProductBoxDB = 'ProductBox';

  static Future<void> init() async {
    var appDirectory = await getApplicationDocumentsDirectory();

    Hive
      ..init(appDirectory.path)
      ..registerAdapter(ProductFavoriteTableAdapter())
      ..registerAdapter(CategoryTableAdapter())
      ..registerAdapter(ProductCartTableAdapter());
    favoritesProductDB = await Hive.openBox(_favoriteProductBoxDB);
    cartProductDB = await Hive.openBox(_cartProductBoxDB);
  }
}

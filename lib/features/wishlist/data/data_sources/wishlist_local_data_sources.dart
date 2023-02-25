import 'package:hive/hive.dart';

import '../tables/product_favorite_table.dart';

abstract class WishlistLocalDataSource {
  Future<List<ProductFavoriteTable>> getAllProducts();

  Future<ProductFavoriteTable> getProductById(int id);

  Future<void> saveProductById(ProductFavoriteTable product);

  Future<void> deleteProductById(int id);

  Future<bool> checkIfProductFavorite(int id);
}

class WishlistLocalDataSourceImpl implements WishlistLocalDataSource {
  static const _productBox = 'ProductBox';

  Future<Box<dynamic>> _openBox() async => await Hive.openBox(_productBox);

  @override
  Future<void> saveProductById(ProductFavoriteTable product) async {
    final productBox = await _openBox();
    if (productBox.containsKey(product.id)) return;
    await productBox.put(product.id, product);
  }

  @override
  Future<List<ProductFavoriteTable>> getAllProducts() async {
    final productBox = await _openBox();
    final productIds = productBox.keys;
    List<ProductFavoriteTable> products = [];
    for (var productId in productIds) {
      products.add(productBox.get(productId));
    }
    return products;
  }

  @override
  Future<ProductFavoriteTable> getProductById(int id) async {
    final productBox = await _openBox();

    late ProductFavoriteTable productTable;
    if (productBox.containsKey(id)) {
      final product = await productBox.get(id);
      productTable = ProductFavoriteTable.fromEntity(product);
    }
    return productTable;
  }

  @override
  Future<void> deleteProductById(int id) async {
    final productBox = await _openBox();
    await productBox.delete(id);
  }

  @override
  Future<bool> checkIfProductFavorite(int id) async {
    final productBox = await _openBox();
    return productBox.containsKey(id);
  }
}

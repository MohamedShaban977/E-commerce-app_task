import 'package:hive/hive.dart';

import '../tables/product_cart_table.dart';


abstract class CartLocalDataSource {
  Future<List<ProductCartTable>> getAllProducts();

  Future<ProductCartTable> getProductById(int id);

  Future<void> saveProductById(ProductCartTable product);

  Future<void> deleteProductById(int id);

  Future<bool> checkIfProductFavorite(int id);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  static const _productBox = 'cartProductBox';

  Future<Box<dynamic>> _openBox() async => await Hive.openBox(_productBox);

  @override
  Future<void> saveProductById(ProductCartTable product) async {
    final productBox = await _openBox();
    if(productBox.containsKey(product.id)) {
      await productBox.delete(product.id);
      await productBox.put(product.id, product);
    }
    await productBox.put(product.id, product);
  }

  @override
  Future<List<ProductCartTable>> getAllProducts() async {
    final productBox = await _openBox();
    final productIds = productBox.keys;
    List<ProductCartTable> products = [];
    for (var productId in productIds) {
      products.add(productBox.get(productId));
    }
    return products;
  }

  @override
  Future<ProductCartTable> getProductById(int id) async {
    final productBox = await _openBox();

    late  ProductCartTable productTable ;
    if (productBox.containsKey(id)) {
      final product = await productBox.get(id);
      productTable = ProductCartTable.fromEntity(product);
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


import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_point.dart';
import '../../../../core/api/service_response.dart';
import '../models/products_response.dart';

abstract class ProductsDataSource {
  Future<CollectionResponse<ProductsResponse>> getAllProducts();

  Future<CollectionResponse<ProductsResponse>> getProductsByCategory(
      String idCategory);

  Future<CollectionResponse<ProductsResponse>> getMostPopularProducts();

  Future<CollectionResponse<ProductsResponse>> getMostRecentProducts();
}

class ProductsDataSourceImpl implements ProductsDataSource {
  ApiConsumer apiConsumer;

  ProductsDataSourceImpl({required this.apiConsumer});

  final String _mostRecent = '5';
  final String _mostPopular = '1';

  @override
  Future<CollectionResponse<ProductsResponse>> getAllProducts() async {
    final response = await apiConsumer.get(EndPoint.products);

    final res = CollectionResponse<ProductsResponse>.fromJson(response,
        (list) => list.map((e) => ProductsResponse.fromJson(e)).toList());
    return res;
  }

  @override
  Future<CollectionResponse<ProductsResponse>> getProductsByCategory(
      String idCategory) async {
    final response =
        await apiConsumer.get('${EndPoint.productsByCategoryById}$idCategory/');

    final res = CollectionResponse<ProductsResponse>.fromJson(response,
        (list) => list.map((e) => ProductsResponse.fromJson(e)).toList());
    return res;
  }

  @override
  Future<CollectionResponse<ProductsResponse>> getMostPopularProducts() async {
    final response = await apiConsumer
        .get('${EndPoint.productsByCategoryById}$_mostPopular/');

    final res = CollectionResponse<ProductsResponse>.fromJson(response,
        (list) => list.map((e) => ProductsResponse.fromJson(e)).toList());
    return res;
  }

  @override
  Future<CollectionResponse<ProductsResponse>> getMostRecentProducts() async {
    final response = await apiConsumer
        .get('${EndPoint.productsByCategoryById}$_mostRecent/');

    final res = CollectionResponse<ProductsResponse>.fromJson(response,
        (list) => list.map((e) => ProductsResponse.fromJson(e)).toList());
    return res;
  }
}

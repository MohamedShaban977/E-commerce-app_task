import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_point.dart';
import '../../../../core/api/service_response.dart';
import '../models/product_details_response.dart';

abstract class ProductDetailsDataSource {
  Future<CollectionResponse<ProductDetailsResponse>> getProductDetails(
      String id);
}

class ProductDetailsDataSourceImpl implements ProductDetailsDataSource {
  ApiConsumer apiConsumer;

  ProductDetailsDataSourceImpl({required this.apiConsumer});

  @override
  Future<CollectionResponse<ProductDetailsResponse>> getProductDetails(
      String id) async {
    final response = await apiConsumer.get('${EndPoint.productById}$id/');
    final res = CollectionResponse<ProductDetailsResponse>.fromJson(
        CollectionResponse(
                count: response != null ? 1 : 0,
                next: null,
                previous: null,
                results: response)
            .toJson(),
        (list) => list.map((e) => ProductDetailsResponse.fromJson(e)).toList());
    return res;
  }
}

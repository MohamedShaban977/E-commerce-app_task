import 'package:e_commerce_app_task/core/api/service_response.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_point.dart';
import '../models/categories_response.dart';

abstract class CategoriesDataSource {
  /// TODO : Add Service Response
  Future<CollectionResponse<CategoriesResponse>> categoriesDataSource();
}

class CategoriesDataSourceImpl implements CategoriesDataSource {
  ApiConsumer apiConsumer;

  CategoriesDataSourceImpl({required this.apiConsumer});

  @override
  Future<CollectionResponse<CategoriesResponse>> categoriesDataSource() async {
    final response = await apiConsumer.get(EndPoint.categories);
    final res = CollectionResponse<CategoriesResponse>.fromJson(
        response,
            (list) => list.map((e) => CategoriesResponse.fromJson(e)).toList());
    return res;
  }
}

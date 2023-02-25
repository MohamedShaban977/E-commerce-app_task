import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/features/products/domain/entities/products_entity.dart';

import '../../../../core/api/service_response.dart';
import '../../../../core/error/failures.dart';

abstract class ProductsRepository {
  Future<Either<Failure, CollectionResponseEntity<ProductsEntity>>>
      getAllProducts();

  Future<Either<Failure, CollectionResponse<ProductsEntity>>>
      getProductsByCategory(String idCategory);

  Future<Either<Failure, CollectionResponse<ProductsEntity>>>
      getMostPopularProducts();

  Future<Either<Failure, CollectionResponse<ProductsEntity>>>
      getMostRecentProducts();
}

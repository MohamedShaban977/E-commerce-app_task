import 'package:dartz/dartz.dart';

import '../../../../core/api/service_response.dart';
import '../../../../core/error/failures.dart';
import '../entities/product_details_entity.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, CollectionResponseEntity<ProductDetailsEntity>>> getProductDetails(String id);

}

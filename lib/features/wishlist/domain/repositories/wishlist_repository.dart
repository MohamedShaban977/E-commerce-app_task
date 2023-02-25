import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';

abstract class WishlistRepository {
  Future<Either<Failure, List<ProductDetailsEntity>>> getAllProducts();

  Future<Either<Failure, ProductDetailsEntity>> getProductById(int id);

  Future<Either<Failure, void>> saveProductById(ProductDetailsEntity product);

  Future<Either<Failure, void>> deleteProductById(int id);

  Future<Either<Failure, bool>> checkIfProductFavorite(int id);
}

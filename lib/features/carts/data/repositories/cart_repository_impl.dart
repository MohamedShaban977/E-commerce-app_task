import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../data_sources/cart_local_data_sources.dart';
import '../tables/product_cart_table.dart';

class CartRepositoryImpl extends CartRepository {
  final CartLocalDataSource dataSource;

  CartRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> saveProductById(
      ProductDetailsEntity product) async {
    try {
      final response = await dataSource
          .saveProductById(ProductCartTable.fromEntity(product));
      return Right(response);
    } on Exception catch (error) {
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductDetailsEntity>>> getAllProducts() async {
    try {
      final response = await dataSource.getAllProducts();
      return Right(response);
    } on Exception catch (error) {
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductById(int id) async {
    try {
      final response = await dataSource.getProductById(id);
      return Right(response);
    } on Exception catch (error) {
      return Left(CacheFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProductById(int id) async {
    try {
      final response = await dataSource.deleteProductById(id);
      return Right(response);
    } on Exception catch (error) {
      return Left(CacheFailure(error.toString()));
    }
  }
}

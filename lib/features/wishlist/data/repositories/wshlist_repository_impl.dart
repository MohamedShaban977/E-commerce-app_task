import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/error/exceptions.dart';
import 'package:e_commerce_app_task/core/error/failures.dart';

import '../../../product_details/domain/entities/product_details_entity.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../data_sources/wishlist_local_data_sources.dart';
import '../tables/product_favorite_table.dart';

class WishlistRepositoryImpl extends WishlistRepository {
  final WishlistLocalDataSource dataSource;

  WishlistRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> saveProductById(
      ProductDetailsEntity product) async {
    try {
      final response = await dataSource
          .saveProductById(ProductFavoriteTable.fromEntity(product));
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

  @override
  Future<Either<Failure, bool>> checkIfProductFavorite(int id) async {
    try {
      final response = await dataSource.checkIfProductFavorite(id);
      return Right(response);
    } on CacheException catch (error) {
      return Left(CacheFailure(error.toString()));
    }
  }
}

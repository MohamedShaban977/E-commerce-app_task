import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/api/service_response.dart';
import 'package:e_commerce_app_task/core/app_manage/strings_manager.dart';
import 'package:e_commerce_app_task/core/error/failures.dart';
import 'package:e_commerce_app_task/features/products/domain/entities/products_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/products_repository.dart';
import '../data_sources/products_data_sourse.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource dataSource;

  ProductsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, CollectionResponseEntity<ProductsEntity>>>
      getAllProducts() async {
    try {
      final res = await dataSource.getAllProducts();

      return res.results.isNotEmpty
          ? Right(res)
          : left(const ServerFailure(AppStrings.errorOccurred));
    } on ServerException catch (error) {
      return left(ServerFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, CollectionResponse<ProductsEntity>>>
      getProductsByCategory(String idCategory) async {
    try {
      final res = await dataSource.getProductsByCategory(idCategory);

      return Right(res);
    } on ServerException catch (error) {
      return left(ServerFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, CollectionResponse<ProductsEntity>>>
      getMostPopularProducts() async {
    try {
      final res = await dataSource.getMostPopularProducts();

      return Right(res);
    } on ServerException catch (error) {
      return left(ServerFailure(error.message));
    }
  }

  @override
  Future<Either<Failure, CollectionResponse<ProductsEntity>>>
      getMostRecentProducts() async {
    try {
      final res = await dataSource.getMostRecentProducts();

      return Right(res);
    } on ServerException catch (error) {
      return left(ServerFailure(error.message));
    }
  }
}

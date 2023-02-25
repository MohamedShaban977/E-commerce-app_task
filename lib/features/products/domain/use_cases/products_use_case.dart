import 'package:dartz/dartz.dart';

import '../../../../core/api/service_response.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/useCases/use_case.dart';
import '../entities/products_entity.dart';
import '../repositories/products_repository.dart';

class ProductsUseCase
    implements UseCase<CollectionResponseEntity<ProductsEntity>, NoParams> {
  final ProductsRepository repository;

  ProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, CollectionResponseEntity<ProductsEntity>>> call(
          NoParams params) =>
      repository.getAllProducts();
}

class MostRecentProductsUseCase
    implements UseCase<CollectionResponseEntity<ProductsEntity>, NoParams> {
  final ProductsRepository repository;

  MostRecentProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, CollectionResponseEntity<ProductsEntity>>> call(
          NoParams params) =>
      repository.getMostRecentProducts();
}

class MostPopularProductsUseCase
    implements UseCase<CollectionResponseEntity<ProductsEntity>, NoParams> {
  final ProductsRepository repository;

  MostPopularProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, CollectionResponseEntity<ProductsEntity>>> call(
          NoParams params) =>
      repository.getMostPopularProducts();
}

class ProductsByCategoryUseCase
    implements UseCase<CollectionResponseEntity<ProductsEntity>, String> {
  final ProductsRepository repository;

  ProductsByCategoryUseCase({required this.repository});

  @override
  Future<Either<Failure, CollectionResponseEntity<ProductsEntity>>> call(
          String idCategory) =>
      repository.getProductsByCategory(idCategory);
}

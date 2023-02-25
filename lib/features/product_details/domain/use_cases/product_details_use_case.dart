

import 'package:dartz/dartz.dart';

import '../../../../core/api/service_response.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/useCases/use_case.dart';
import '../entities/product_details_entity.dart';
import '../repositories/product_details_repository.dart';

class ProductDetailsUseCase implements UseCase<CollectionResponseEntity<ProductDetailsEntity>, String> {
  final ProductDetailsRepository repository;

  ProductDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, CollectionResponseEntity<ProductDetailsEntity>>> call(String id) => repository.getProductDetails(id);
}


import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/api/service_response.dart';
import 'package:e_commerce_app_task/core/error/failures.dart';
import 'package:e_commerce_app_task/features/product_details/data/data_sources/product_details_data_source.dart';
import 'package:e_commerce_app_task/features/product_details/domain/entities/product_details_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/product_details_repository.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsDataSource dataSource;

  ProductDetailsRepositoryImpl({required this.dataSource});


  @override
  Future<Either<Failure, CollectionResponseEntity<ProductDetailsEntity>>> getProductDetails(String id) async {
    try {
      final res = await dataSource.getProductDetails(id);

      return  Right(res) ;
    } on ServerException catch (error) {
      return left(ServerFailure(error.message));
    }
  }
}
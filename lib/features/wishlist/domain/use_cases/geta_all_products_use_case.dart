import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/error/failures.dart';
import 'package:e_commerce_app_task/features/product_details/domain/entities/product_details_entity.dart';
import 'package:e_commerce_app_task/features/wishlist/domain/repositories/wishlist_repository.dart';

import '../../../../core/useCases/use_case.dart';

class GetAllProductsUseCase
    extends UseCase<List<ProductDetailsEntity>, NoParams> {
  final WishlistRepository repository;

  GetAllProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductDetailsEntity>>> call(
      NoParams params) async {
    return await repository.getAllProducts();
  }
}

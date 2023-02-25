import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/error/failures.dart';
import 'package:e_commerce_app_task/features/product_details/domain/entities/product_details_entity.dart';
import 'package:e_commerce_app_task/features/wishlist/domain/repositories/wishlist_repository.dart';

import '../../../../core/useCases/use_case.dart';

class SaveProductByIdUseCase extends UseCase<void, ProductDetailsEntity> {
  final WishlistRepository repository;

  SaveProductByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(ProductDetailsEntity params) async {
    return await repository.saveProductById(params);
  }
}
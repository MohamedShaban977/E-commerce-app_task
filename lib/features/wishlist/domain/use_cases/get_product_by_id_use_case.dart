import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/useCases/use_case.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import '../repositories/wishlist_repository.dart';

class GetProductByIdUseCase extends UseCase<ProductDetailsEntity, int> {
  final WishlistRepository repository;

  GetProductByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductDetailsEntity>> call(int id) async {
    return await repository.getProductById(id);
  }
}
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/useCases/use_case.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import '../repositories/cart_repository.dart';

class GetCartProductByIdUseCase extends UseCase<ProductDetailsEntity, int> {
  final CartRepository repository;

  GetCartProductByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductDetailsEntity>> call(int id) async {
    return await repository.getProductById(id);
  }
}
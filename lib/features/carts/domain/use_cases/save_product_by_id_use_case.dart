import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/useCases/use_case.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import '../repositories/cart_repository.dart';

class SaveCartProductByIdUseCase extends UseCase<void, ProductDetailsEntity> {
  final CartRepository repository;

  SaveCartProductByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(ProductDetailsEntity params) async {
    return await repository.saveProductById(params);
  }
}
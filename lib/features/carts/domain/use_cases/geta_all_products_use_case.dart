import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/useCases/use_case.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import '../repositories/cart_repository.dart';

class GetAllCartProductsUseCase
    extends UseCase<List<ProductDetailsEntity>, NoParams> {
  final CartRepository repository;

  GetAllCartProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductDetailsEntity>>> call(
      NoParams params) async {
    return await repository.getAllProducts();
  }
}

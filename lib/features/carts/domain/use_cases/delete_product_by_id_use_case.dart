import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/useCases/use_case.dart';
import '../repositories/cart_repository.dart';

class DeleteCartProductByIdUseCase extends UseCase<void, int> {
  final CartRepository repository;

  DeleteCartProductByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(int id) async =>
      await repository.deleteProductById(id);
}

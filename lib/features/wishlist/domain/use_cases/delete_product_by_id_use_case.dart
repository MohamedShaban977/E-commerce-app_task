import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/error/failures.dart';

import '../../../../core/useCases/use_case.dart';
import '../repositories/wishlist_repository.dart';

class DeleteProductByIdUseCase extends UseCase<void, int> {
  final WishlistRepository repository;

  DeleteProductByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(int id) async =>
      await repository.deleteProductById(id);
}

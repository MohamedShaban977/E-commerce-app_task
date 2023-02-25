import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/useCases/use_case.dart';
import '../repositories/wishlist_repository.dart';

class CheckIfProductFavoriteUseCase extends UseCase<bool, int> {
  final WishlistRepository repository;

  CheckIfProductFavoriteUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(int id) async {
    return await repository.checkIfProductFavorite(id);
  }
}

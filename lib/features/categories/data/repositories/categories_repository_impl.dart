import 'package:dartz/dartz.dart';



import '../../../../core/api/service_response.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/categories_entity.dart';
import '../../domain/repositories/categories_repository.dart';
import '../data_sources/categories_data_sources.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesDataSource dataSource;

  CategoriesRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, CollectionResponseEntity<CategoriesEntity>>> categoriesRepo() async {
    try {
      final res = await dataSource.categoriesDataSource();
      return  Right(res) ;

    } on ServerException catch (error) {
      return left(ServerFailure(error.message));
    }
  }

}
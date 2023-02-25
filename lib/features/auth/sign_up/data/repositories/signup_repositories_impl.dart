import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/app_manage/strings_manager.dart';
import 'package:e_commerce_app_task/features/auth/sign_up/data/data_sources/signup_data_source.dart';
import 'package:e_commerce_app_task/features/auth/sign_up/domain/entities/signup_entity.dart';
import 'package:e_commerce_app_task/features/auth/sign_up/domain/repositories/signup_repositories.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/error/failures.dart';
import '../models/signup_request.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataSource dataSource;

  SignUpRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, SignUpEntity>> signUpUser(
      SignUpRequest request) async {
    try {
      final res = await dataSource.signUpDataSource(request);

      return res.user != null
          ? Right(res)
          : left(const ServerFailure(AppStrings.errorOccurred));
    } on ServerException catch (error) {
      return left(ServerFailure(error.message));
    }
  }
}

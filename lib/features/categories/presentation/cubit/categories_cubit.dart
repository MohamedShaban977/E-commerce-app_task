import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/core/useCases/use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/service_response.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/categories_entity.dart';
import '../../domain/use_cases/categories_use_cases.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.categoriesUseCases}) : super(CategoriesInitial());


  final CategoriesUseCases categoriesUseCases;


  CategoriesCubit get(context) => BlocProvider.of(context);


  List<CategoriesEntity> categoriesList =[] ;
  Future<void> categories() async {
    emit(CategoriesLoadingState());
    Either<Failure, CollectionResponseEntity<CategoriesEntity>> response = await categoriesUseCases.call(NoParams());
    response.fold(
          (failure) => emit(CategoriesErrorState(error: HandleFailure.mapFailureToMsg(failure))),
          (response) {
            categoriesList = response.results;
            emit(CategoriesSuccessState(response: response));

          }
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/features/products/domain/entities/products_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/service_response.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/useCases/use_case.dart';
import '../../domain/use_cases/products_use_case.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({
    required this.productsUseCase,
    required this.productsByCategoryUseCase,
    required this.mostRecentProductsUseCase,
    required this.mostPopularProductsUseCase,
  }) : super(ProductsInitial());

  final ProductsUseCase productsUseCase;
  final ProductsByCategoryUseCase productsByCategoryUseCase;
  final MostRecentProductsUseCase mostRecentProductsUseCase;
  final MostPopularProductsUseCase mostPopularProductsUseCase;

  ProductsCubit get(context) => BlocProvider.of(context);

  List<ProductsEntity> allProducts = [];
  Future<void> getAllProducts() async {
    emit(GetProductsLoadingState());
    Either<Failure, CollectionResponseEntity<ProductsEntity>> response =
        await productsUseCase.call(NoParams());
    response.fold(
        (failure) =>
            emit(GetProductsErrorState(HandleFailure.mapFailureToMsg(failure))),
        (response) {
      allProducts = response.results;
      emit(GetProductsSuccessState(response));
    });
  }


  List<ProductsEntity> allProductsByCategory = [];
  Future<void> getProductsByCategory({required String idCategory}) async {
    emit(GetProductsByCategoryLoadingState());
    Either<Failure, CollectionResponseEntity<ProductsEntity>> response = await productsByCategoryUseCase.call(idCategory);
    response.fold(
        (failure) => emit(GetProductsByCategoryErrorState(HandleFailure.mapFailureToMsg(failure))), (response) {
      allProductsByCategory = response.results;
      emit(GetProductsByCategorySuccessState(response));
    });
  }


  List<ProductsEntity> productsMostRecent = [];
  Future<void> getProductsMostRecent() async {
    emit(GetProductsMostRecentLoadingState());
    Either<Failure, CollectionResponseEntity<ProductsEntity>> response =
        await mostRecentProductsUseCase.call(NoParams());
    response.fold(
        (failure) => emit(GetProductsMostRecentErrorState(
            HandleFailure.mapFailureToMsg(failure))), (response) {
      productsMostRecent = response.results;
      emit(GetProductsMostRecentSuccessState(response));
    });
  }

  List<ProductsEntity> productsMostPopular = [];
  Future<void> getProductsMostPopular() async {
    emit(GetProductsMostPopularLoadingState());
    Either<Failure, CollectionResponseEntity<ProductsEntity>> response =
        await mostPopularProductsUseCase.call(NoParams());
    response.fold(
        (failure) => emit(GetProductsMostPopularErrorState(
            HandleFailure.mapFailureToMsg(failure))), (response) {
      productsMostPopular = response.results;
      emit(GetProductsMostPopularSuccessState(response));
    });
  }
}

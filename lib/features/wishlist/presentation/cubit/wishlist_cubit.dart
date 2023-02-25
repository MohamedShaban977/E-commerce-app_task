import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cache/hive_helper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/useCases/use_case.dart';
import '../../../product_details/data/models/product_details_response.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import '../../domain/use_cases/check_if_product_favorite_use_case.dart';
import '../../domain/use_cases/delete_product_by_id_use_case.dart';
import '../../domain/use_cases/get_product_by_id_use_case.dart';
import '../../domain/use_cases/geta_all_products_use_case.dart';
import '../../domain/use_cases/save_product_by_id_use_case.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(
      {required this.saveProduct,
      required this.getAllProducts,
      required this.getProductById,
      required this.deleteProductById,
      required this.checkIfProductFavorite})
      : super(WishlistInitial());

  final SaveProductByIdUseCase saveProduct;
  final GetAllProductsUseCase getAllProducts;
  final GetProductByIdUseCase getProductById;
  final DeleteProductByIdUseCase deleteProductById;
  final CheckIfProductFavoriteUseCase checkIfProductFavorite;

  WishlistCubit get(context) => BlocProvider.of(context);

  List<ProductDetailsEntity> productsFavorite = [];

  Future<void> getAllProductsFavorite() async {
    emit(GetAllProductsFavoriteLoadingState());
    Either<Failure, List<ProductDetailsEntity>> response =
        await getAllProducts.call(NoParams());
    response.fold(
        (failure) => emit(GetAllProductsFavoriteErrorState(
            HandleFailure.mapFailureToMsg(failure))), (response) {
      productsFavorite = response;
      emit(GetAllProductsFavoriteSuccessState(response));
    });
  }

  Future<void> saveProductFavorite(ProductDetailsEntity product) async {
    emit(SaveProductByIdLoadingState());
    Either<Failure, void> response = await saveProduct.call(product);
    response.fold(
      (failure) => emit(SaveProductByIdErrorState(HandleFailure.mapFailureToMsg(failure))),
      (response) => emit(SaveProductByIdSuccessState()),
    );
  }
  //
  // Future<void> getProductByIdFavorite(int idProduct) async {
  //   emit(GetProductByIdLoadingState());
  //   Either<Failure, ProductDetailsEntity> response = await getProductById.call(idProduct);
  //   response.fold(
  //     (failure) => emit(GetProductByIdErrorState(HandleFailure.mapFailureToMsg(failure))),
  //     (response) => emit(GetProductByIdSuccessState(response)),
  //   );
  // }

  Future<void> deleteProductByIdFavorite(int idProduct) async {
    emit(DeleteProductByIdLoadingState());
    Either<Failure, void> response = await deleteProductById.call(idProduct);
    response.fold(
      (failure) => emit(DeleteProductByIdErrorState(HandleFailure.mapFailureToMsg(failure))),
      (response) {
        productsFavorite.removeWhere((element) => element.id ==idProduct);
        emit(DeleteProductByIdSuccessState());
      },
    );
  }
  Future<void> toggleIsFavorite(ProductDetailsEntity product) async {
    if (HiveHelper.favoritesProductDB.containsKey(product.id)) {
      await deleteProductByIdFavorite(product.id);
    }
    else {
      await saveProductFavorite(product);
    }

  }

  IconData isFavoriteIcon (int id)=>HiveHelper.favoritesProductDB.containsKey(id) ? Icons.favorite : Icons.favorite_border;

}

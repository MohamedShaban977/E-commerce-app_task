import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/features/carts/data/tables/product_cart_table.dart';
import 'package:e_commerce_app_task/features/carts/domain/use_cases/geta_all_products_use_case.dart';
import 'package:e_commerce_app_task/features/carts/domain/use_cases/save_product_by_id_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cache/hive_helper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/useCases/use_case.dart';
import '../../../product_details/domain/entities/product_details_entity.dart';
import '../../../wishlist/data/tables/product_favorite_table.dart';
import '../../domain/use_cases/delete_product_by_id_use_case.dart';
import '../../domain/use_cases/get_product_by_id_use_case.dart';

part 'carts_state.dart';

class CartsCubit extends Cubit<CartsState> {
  CartsCubit(
      {required this.saveProduct,
      required this.getAllProducts,
      required this.getProductById,
      required this.deleteProductById})
      : super(CartsInitial());

  final SaveCartProductByIdUseCase saveProduct;
  final GetAllCartProductsUseCase getAllProducts;
  final GetCartProductByIdUseCase getProductById;
  final DeleteCartProductByIdUseCase deleteProductById;

  CartsCubit get(context) => BlocProvider.of(context);

  List<ProductDetailsEntity> productsCart = [];

  Future<void> getAllProductsInCart() async {
    emit(GetAllProductsCartLoadingState());
    Either<Failure, List<ProductDetailsEntity>> response =
        await getAllProducts.call(NoParams());
    response.fold(
        (failure) => emit(GetAllProductsCartErrorState(
            HandleFailure.mapFailureToMsg(failure))), (response) {
      productsCart = response;

      emit(GetAllProductsCartSuccessState(response));
    });
  }

  Future<void> saveProductCart(ProductDetailsEntity product) async {
    emit(SaveProductByIdLoadingState());
    Either<Failure, void> response = await saveProduct.call(product);
    response.fold(
      (failure) => emit(
          SaveProductByIdErrorState(HandleFailure.mapFailureToMsg(failure))),
      (response) => emit(SaveProductByIdSuccessState()),
    );
    getAllProductsInCart();
  }

  Future<void> getProductByIdCart(int idProduct) async {
    emit(GetProductByIdLoadingState());
    Either<Failure, ProductDetailsEntity> response =
        await getProductById.call(idProduct);
    response.fold(
      (failure) => emit(
          GetProductByIdErrorState(HandleFailure.mapFailureToMsg(failure))),
      (response) => emit(GetProductByIdSuccessState(response)),
    );
  }

  Future<void> deleteProductByIdCart(int idProduct) async {
    emit(DeleteProductByIdLoadingState());
    Either<Failure, void> response = await deleteProductById.call(idProduct);
    response.fold(
      (failure) => emit(
          DeleteProductByIdErrorState(HandleFailure.mapFailureToMsg(failure))),
      (response) {
        productsCart.removeWhere((element) => element.id == idProduct);
        emit(DeleteProductByIdSuccessState());
      },
    );
  }

  int getCountQuantity(int index) => productsCart[index].quantity!;

  int countQuantity = 0;

  Future<void> decrementQuantity(ProductDetailsEntity product) async {
    emit(CountInitial());
      countQuantity = product.quantity!;

    if (countQuantity <= 1) return;
    countQuantity--;
    HiveHelper.cartProductDB.put(product.id, ProductCartTable(
            id: product.id,
            name: product.name,
            imageLink: product.imageLink,
            price: product.price,
            description: product.description,
            rate: product.rate,
            category: CategoryTable(
              id: product.category!.id,
              name: product.category!.name,
              imageLink: product.category!.imageLink,
            ),
            quantity: countQuantity));
    getAllProductsInCart();
    emit(IncrementQuantityState());
  }

  Future<void> incrementQuantity(ProductDetailsEntity product) async {
    emit(CountInitial());
      countQuantity = product.quantity!;

    countQuantity++;
    HiveHelper.cartProductDB.put(product.id, ProductCartTable(
        id: product.id,
        name: product.name,
        imageLink: product.imageLink,
        price: product.price,
        description: product.description,
        rate: product.rate,
        category: CategoryTable(
          id: product.category!.id,
          name: product.category!.name,
          imageLink: product.category!.imageLink,
        ),
        quantity: countQuantity));
    getAllProductsInCart();
    print(product.quantity);

    emit(IncrementQuantityState());
  }


  bool isCart(int id) => HiveHelper.cartProductDB.containsKey(id);

  double totalPriceAllProduct() {
    double total = 0.0;
    for (final product in productsCart) {
      total += double.parse(product.price) * product.quantity!;
    }

    return total.floorToDouble();
  }

  int totalQuantity() {
    int total = 0;
    for (final product in productsCart) {
      total += product.quantity!;
    }

    return total;
  }

  double calculateTax() {
    double total = 0.0;
    total = totalPriceAllProduct().floorToDouble() * (14 / 100);

    return total.truncateToDouble();
  }

  double totalPriceProduct(ProductDetailsEntity product) {
    double total = 0.0;
    total += double.parse(product.price) * product.quantity!;

    return total;
  }

  IconData isCartIcon(int id) => HiveHelper.cartProductDB.containsKey(id)
      ? Icons.shopping_cart
      : Icons.add_shopping_cart;
}

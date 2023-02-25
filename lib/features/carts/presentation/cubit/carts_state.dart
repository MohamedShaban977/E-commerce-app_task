part of 'carts_cubit.dart';

abstract class CartsState extends Equatable {
  const CartsState();

  @override
  List<Object> get props => [];
}

class CartsInitial extends CartsState {}

///
class SaveProductByIdLoadingState extends CartsState {}

class SaveProductByIdSuccessState extends CartsState {}

class SaveProductByIdErrorState extends CartsState {
  final String error;

  const SaveProductByIdErrorState(this.error);

  @override
  List<Object> get props => [error];
}

///
class GetAllProductsCartLoadingState extends CartsState {}

class GetAllProductsCartSuccessState extends CartsState {
  final List<ProductDetailsEntity> response;

  const GetAllProductsCartSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class GetAllProductsCartErrorState extends CartsState {
  final String error;

  const GetAllProductsCartErrorState(this.error);

  @override
  List<Object> get props => [error];
}

///
class GetProductByIdLoadingState extends CartsState {}

class GetProductByIdSuccessState extends CartsState {
  final ProductDetailsEntity response;

  const GetProductByIdSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class GetProductByIdErrorState extends CartsState {
  final String error;

  const GetProductByIdErrorState(this.error);

  @override
  List<Object> get props => [error];
}

///
class DeleteProductByIdLoadingState extends CartsState {}

class DeleteProductByIdSuccessState extends CartsState {}

class DeleteProductByIdErrorState extends CartsState {
  final String error;

  const DeleteProductByIdErrorState(this.error);

  @override
  List<Object> get props => [error];
}

///
class CheckIfProductFavoriteLoadingState extends CartsState {}

class CheckIfProductFavoriteSuccessState extends CartsState {
  final bool checkIfProductFavorite;

  const CheckIfProductFavoriteSuccessState(this.checkIfProductFavorite);

  @override
  List<Object> get props => [checkIfProductFavorite];
}

class CheckIfProductFavoriteErrorState extends CartsState {
  final String error;

  const CheckIfProductFavoriteErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class CountInitial extends CartsState {}

class DecrementQuantityState extends CartsState {}

class IncrementQuantityState extends CartsState {}

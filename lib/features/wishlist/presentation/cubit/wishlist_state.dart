part of 'wishlist_cubit.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistInitial extends WishlistState {}

///
class SaveProductByIdLoadingState extends WishlistState {}

class SaveProductByIdSuccessState extends WishlistState {}

class SaveProductByIdErrorState extends WishlistState {
  final String error;

  const SaveProductByIdErrorState(this.error);

  @override
  List<Object> get props => [error];
}

///
class GetAllProductsFavoriteLoadingState extends WishlistState {}

class GetAllProductsFavoriteSuccessState extends WishlistState {
  final List<ProductDetailsEntity> response;

  const GetAllProductsFavoriteSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class GetAllProductsFavoriteErrorState extends WishlistState {
  final String error;

  const GetAllProductsFavoriteErrorState(this.error);

  @override
  List<Object> get props => [error];
}

///
class GetProductByIdLoadingState extends WishlistState {}

class GetProductByIdSuccessState extends WishlistState {
  final ProductDetailsEntity response;

  const GetProductByIdSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class GetProductByIdErrorState extends WishlistState {
  final String error;

  const GetProductByIdErrorState(this.error);

  @override
  List<Object> get props => [error];
}

///
class DeleteProductByIdLoadingState extends WishlistState {}

class DeleteProductByIdSuccessState extends WishlistState {}

class DeleteProductByIdErrorState extends WishlistState {
  final String error;

  const DeleteProductByIdErrorState(this.error);

  @override
  List<Object> get props => [error];
}

///
class CheckIfProductFavoriteLoadingState extends WishlistState {}

class CheckIfProductFavoriteSuccessState extends WishlistState {
  final bool checkIfProductFavorite;

  const CheckIfProductFavoriteSuccessState(this.checkIfProductFavorite);

  @override
  List<Object> get props => [checkIfProductFavorite];
}

class CheckIfProductFavoriteErrorState extends WishlistState {
  final String error;

  const CheckIfProductFavoriteErrorState(this.error);

  @override
  List<Object> get props => [error];
}

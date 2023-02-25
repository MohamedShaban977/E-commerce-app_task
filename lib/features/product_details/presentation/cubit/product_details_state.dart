part of 'product_details_cubit.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();
  @override
  List<Object> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}


class GetProductDetailsLoadingState extends ProductDetailsState {}

class GetProductDetailsSuccessState extends ProductDetailsState {
  final CollectionResponseEntity<ProductDetailsEntity> response;

  const GetProductDetailsSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class GetProductDetailsErrorState extends ProductDetailsState {
  final String error;

  const GetProductDetailsErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class CountInitial extends ProductDetailsState {}
class DecrementQuantityState extends ProductDetailsState {}
class IncrementQuantityState extends ProductDetailsState {}

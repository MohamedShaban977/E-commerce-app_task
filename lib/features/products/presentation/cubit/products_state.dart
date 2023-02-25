part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class GetProductsLoadingState extends ProductsState {}

class GetProductsSuccessState extends ProductsState {
  final CollectionResponseEntity<ProductsEntity> response;

  const GetProductsSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class GetProductsErrorState extends ProductsState {
  final String error;

  const GetProductsErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class GetProductsByCategoryLoadingState extends ProductsState {}

class GetProductsByCategorySuccessState extends ProductsState {
  final CollectionResponseEntity<ProductsEntity> response;

  const GetProductsByCategorySuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class GetProductsByCategoryErrorState extends ProductsState {
  final String error;

  const GetProductsByCategoryErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class GetProductsMostRecentLoadingState extends ProductsState {}

class GetProductsMostRecentSuccessState extends ProductsState {
  final CollectionResponseEntity<ProductsEntity> response;

  const GetProductsMostRecentSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class GetProductsMostRecentErrorState extends ProductsState {
  final String error;

  const GetProductsMostRecentErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class GetProductsMostPopularLoadingState extends ProductsState {}

class GetProductsMostPopularSuccessState extends ProductsState {
  final CollectionResponseEntity<ProductsEntity> response;

  const GetProductsMostPopularSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class GetProductsMostPopularErrorState extends ProductsState {
  final String error;

  const GetProductsMostPopularErrorState(this.error);

  @override
  List<Object> get props => [error];
}

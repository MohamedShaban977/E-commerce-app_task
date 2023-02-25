part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {

}



class CategoriesLoadingState extends CategoriesState {}
class CategoriesSuccessState extends CategoriesState {
  final CollectionResponseEntity<CategoriesEntity> response;
  const CategoriesSuccessState({required this.response});
  @override
  List<Object> get props => [response];

}
class CategoriesErrorState extends CategoriesState {
  final String error;
  const CategoriesErrorState({required this.error});
  @override
  List<Object> get props => [error];
}



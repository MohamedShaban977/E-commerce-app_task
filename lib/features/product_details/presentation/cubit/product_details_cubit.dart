import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_task/features/product_details/domain/entities/product_details_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/service_response.dart';
import '../../../../core/error/failures.dart';
import '../../domain/use_cases/product_details_use_case.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit({required this.productDetailsUseCase})
      : super(ProductDetailsInitial());
  final ProductDetailsUseCase productDetailsUseCase;

  ProductDetailsCubit get(context) => BlocProvider.of(context);

  late ProductDetailsEntity product;


  int countQuantity = 1;
  double totalPrice = 0.0;
  Future<void> getProductDetailsById({required String id}) async {
    emit(GetProductDetailsLoadingState());
    Either<Failure, CollectionResponseEntity<ProductDetailsEntity>> response =
        await productDetailsUseCase.call(id);
    response.fold(
        (failure) => emit(GetProductDetailsErrorState(
            HandleFailure.mapFailureToMsg(failure))), (response) {
      product = response.results[0];
      totalPrice =double.parse(product.price);
      emit(GetProductDetailsSuccessState(response));
    });
  }

  Future<void> decrementQuantity() async {
    emit(CountInitial());

    if (countQuantity <= 1) return;
    countQuantity--;
    totalPrice = double.parse(product.price) * countQuantity;
    emit(DecrementQuantityState());
  }

  Future<void> incrementQuantity() async {
    emit(CountInitial());
    countQuantity++;
    totalPrice = double.parse(product.price) * countQuantity;
    emit(IncrementQuantityState());
  }
}

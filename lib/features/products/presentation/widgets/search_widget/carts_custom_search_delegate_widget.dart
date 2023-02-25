import 'package:e_commerce_app_task/features/products/presentation/cubit/products_cubit.dart';
import 'package:e_commerce_app_task/features/products/presentation/widgets/search_widget/search_body_carts_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/custom_empty_widget.dart';
import '../../../domain/entities/products_entity.dart';

class ProductsCustomSearchDelegate extends SearchDelegate {
  final ProductsCubit cubit;

  ProductsCustomSearchDelegate(this.cubit);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ProductsEntity> allResult = _getResult();

    return _buildWidgetBody(allResult);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductsEntity> allResult = _getResult();

    return _buildWidgetBody(allResult);
  }

  StatelessWidget _buildWidgetBody(List<ProductsEntity> allResult) {
    if (query.trim().isEmpty) {
      return const CustomEmptyWidget(isSearch: true);
    }
    return allResult.isEmpty
        ? const CustomEmptyWidget()
        : SearchBodyProductsWidget(allResult: allResult);
  }

  List<ProductsEntity> _getResult() {
    final List<ProductsEntity> allResult = cubit.allProductsByCategory
        .where(
          (element) => element.name.toLowerCase().contains(
        query.toLowerCase(),
      ),
    )
        .toList();
    return allResult;
  }
}

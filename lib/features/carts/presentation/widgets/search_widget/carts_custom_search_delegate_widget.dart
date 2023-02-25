import 'package:flutter/material.dart';

import '../../../../../widgets/custom_empty_widget.dart';
import '../../../../product_details/domain/entities/product_details_entity.dart';
import '../../cubit/carts_cubit.dart';
import 'search_body_carts_widget.dart';

class CartsCustomSearchDelegate extends SearchDelegate {
  final CartsCubit cubit;

  CartsCustomSearchDelegate(this.cubit);

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
    List<ProductDetailsEntity> allResult = _getResult();

    return _buildWidgetBody(allResult);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductDetailsEntity> allResult = _getResult();

    return _buildWidgetBody(allResult);
  }

  StatelessWidget _buildWidgetBody(List<ProductDetailsEntity> allResult) {
    if (query.trim().isEmpty) {
      return const CustomEmptyWidget(isSearch: true);
    }
    return allResult.isEmpty
        ? const CustomEmptyWidget()
        : SearchBodyCartsWidget(allResult: allResult);
  }

  List<ProductDetailsEntity> _getResult() {
    final List<ProductDetailsEntity> allResult = cubit.productsCart
        .where(
          (element) => element.name.toLowerCase().contains(
        query.toLowerCase(),
      ),
    )
        .toList();
    return allResult;
  }
}

import 'package:e_commerce_app_task/features/product_details/domain/entities/product_details_entity.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_empty_widget.dart';
import '../cubit/wishlist_cubit.dart';
import 'wishlist_search_body_widget.dart';

class WishlistCustomSearchDelegate extends SearchDelegate {
  final WishlistCubit cubit;

  WishlistCustomSearchDelegate(this.cubit);

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
        : WishlistSearchBodyWidget(allResult: allResult);
  }

  List<ProductDetailsEntity> _getResult() {
    final List<ProductDetailsEntity> allResult = cubit.productsFavorite
        .where(
          (element) => element.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    return allResult;
  }
}

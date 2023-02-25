import 'package:flutter/material.dart';

import '../../../../widgets/custom_empty_widget.dart';
import '../../domain/entities/categories_entity.dart';
import '../cubit/categories_cubit.dart';
import 'search_body_widget.dart';

class CategoriesCustomSearchDelegate extends SearchDelegate {
  final CategoriesCubit cubit;

  CategoriesCustomSearchDelegate(this.cubit);

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
    List<CategoriesEntity> allResult = _getResult();

    return _buildWidgetBody(allResult);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CategoriesEntity> allResult = _getResult();

    return _buildWidgetBody(allResult);
  }

  StatelessWidget _buildWidgetBody(List<CategoriesEntity> allResult) {
    if (query.trim().isEmpty) {
      return const CustomEmptyWidget(isSearch: true);
    }
    return allResult.isEmpty
        ? const CustomEmptyWidget()
        : SearchBodyWidget(allResult: allResult);
  }

  List<CategoriesEntity> _getResult() {
    final List<CategoriesEntity> allResult = cubit.categoriesList
        .where(
          (element) => element.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    return allResult;
  }
}

import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_manage/strings_manager.dart';
import '../../../products/presentation/cubit/products_cubit.dart';
import 'list_view_card_products.dart';

class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({
    super.key,
    required ProductsCubit cubit,
  }) : _cubit = cubit;

  final ProductsCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.mostRecent.tr(), style: context.bodyMedium),
              Text(AppStrings.viewAll.tr(), style: context.bodySmall),
            ],
          ),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              return SizedBox(
                width: context.width,
                child: _handleViewContent(context),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _handleViewContent(BuildContext context) {
    if (_cubit.get(context).productsMostRecent == []) {
      return const SizedBox();
    }
    return ListViewCardProducts(
        listProducts: _cubit.get(context).productsMostRecent);
  }
}

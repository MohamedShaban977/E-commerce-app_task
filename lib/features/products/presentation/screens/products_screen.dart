import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../../core/app_manage/values_manager.dart';
import '../../../../widgets/custom_empty_widget.dart';
import '../../../../widgets/custom_error_widget.dart';
import '../../../../widgets/custom_loading_widget.dart';
import '../cubit/products_cubit.dart';
import '../widgets/products_grid_view.dart';
import '../widgets/search_widget/carts_custom_search_delegate_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsCubit cubit = sl<ProductsCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async => await Future.sync(() => null),
              child: SizedBox(
                height: context.heightBody,
                child: IntrinsicHeight(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                    child: handleScreen(state),
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget handleScreen(state) {
    if (state is GetProductsByCategoryLoadingState) {
      return const CustomLoadingScreen();
    } else if (state is GetProductsByCategorySuccessState &&
        cubit.get(context).allProductsByCategory.isEmpty) {
      return const CustomEmptyWidget();
    } else if (state is GetProductsByCategoryErrorState) {
      return CustomErrorWidget(error: state.error);
    } else {
      return ProductsGridView(
          products: cubit.get(context).allProductsByCategory);
    }
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(AppStrings.products.tr()),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: ProductsCustomSearchDelegate(cubit.get(context)),
            );
          },
        ),
      ],
    );
  }
}

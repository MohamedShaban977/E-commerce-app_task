import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/app_manage/strings_manager.dart';
import 'package:e_commerce_app_task/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection_container.dart';
import '../../../../widgets/custom_image_network_view.dart';
import '../../../../widgets/custom_loading_widget.dart';
import '../cubit/product_details_cubit.dart';
import '../widgets/button_add_to_cart_widget.dart';
import '../widgets/count_pice_and_quantity.dart';
import '../widgets/custom_expansion_tile_widget.dart';
import '../widgets/custom_list_tile_widget.dart';
import '../widgets/name_and_price_and_rate_product_widget.dart';
import '../widgets/row_button_share_and_add_to_favorite.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String id;

  const ProductDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsCubit _cubit = sl<ProductDetailsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _handleBodyScreen(state),
        );
      },
    );
  }

  Widget _handleBodyScreen(state) {
    if (state is GetProductDetailsLoadingState) {
      return const CustomLoadingScreen();
    } else if (state is GetProductDetailsErrorState) {
      return CustomErrorWidget(error: state.error);
    } else {
      return buildBodyScreen();
    }
  }

  RefreshIndicator buildBodyScreen() {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.sync(() =>
            sl<ProductDetailsCubit>()..getProductDetailsById(id: widget.id));
      },
      child: SizedBox(
        height: context.heightBody,
        child: IntrinsicHeight(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: ClampingScrollPhysics()),
            child: Column(
              children: [
                buildTopScreen(),
                const SizedBox(height: 20.0),
                buildBottomScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildTopScreen() {
    return Column(
      children: [

        CustomViewImageNetwork(
          image: _cubit.get(context).product.imageLink,
          height: 340.0,
          width: context.width,
        ),
        RowButtonsShareAndAddToFavorite(product: _cubit.get(context).product),
      ],
    );
  }

  Padding buildBottomScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        children: [
          NameAndPriceAndRateProduct(
            product: _cubit.get(context).product,
          ),
          const SizedBox(height: 12.0),
          buildDescription(),
          const SizedBox(height: 12.0),
          CountPriceAndQuantity(
            cubit: _cubit.get(context),
          ),
          const SizedBox(height: 30.0),
           ButtonAddToCartWidget(detailsCubit: _cubit.get(context), ),
        ],
      ),
    );
  }

  Widget buildDescription() {
    return CustomExpansionTileWidget(
      title: AppStrings.description,
      children: [
        CustomListTileWidget(subTitle: _cubit.get(context).product.description)
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black12,
      ),
    );
  }
}

import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:e_commerce_app_task/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:e_commerce_app_task/widgets/toast_and_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../../core/app_manage/values_manager.dart';
import '../../../../widgets/custom_empty_widget.dart';
import '../../../../widgets/custom_error_widget.dart';
import '../../../../widgets/custom_loading_widget.dart';
import '../../../main_layout_app/presentation/widgets/custom_drawer.dart';
import '../widgets/grid_view_in_wishlist.dart';
import '../widgets/wishlist_custom_search_delegate.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistCubit _cubit = sl<WishlistCubit>();

  @override
  void initState() {
    _cubit.get(context).getAllProductsFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistCubit, WishlistState>(
      listener: (context, state) {
        if (state is DeleteProductByIdSuccessState) {
          ToastAndSnackBar.toastSuccess(
              message: AppStrings.itemRemovedWishlistSuccessfully.tr());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(),
          drawer: const DrawerView(),
          body: CustomLoadingWidget(
            inAsyncCall: state is GetAllProductsFavoriteLoadingState,
            child: RefreshIndicator(
              onRefresh: () async => await sl<WishlistCubit>()
                  .get(context)
                  .getAllProductsFavorite(),
              child: SizedBox(
                height: context.heightBodyWithNav,
                child: IntrinsicHeight(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p18),
                    child: handleScreen(state),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(AppStrings.wishlist.tr()),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: WishlistCustomSearchDelegate(_cubit),
            );
          },
        ),
      ],
    );
  }

  Widget handleScreen(state) {
    if (_cubit.get(context).productsFavorite.isEmpty) {
      return const CustomEmptyWidget();
    } else if (state is GetAllProductsFavoriteErrorState) {
      return CustomErrorWidget(error: state.error);
    } else {
      return GridViewInWishlistView(products: _cubit.productsFavorite);
    }
  }
}

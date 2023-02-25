import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:e_commerce_app_task/features/carts/presentation/cubit/carts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injection_container.dart';
import '../../../../core/app_manage/strings_manager.dart';
import '../../../../core/app_manage/values_manager.dart';
import '../../../../widgets/custom_loading_widget.dart';
import '../../../main_layout_app/presentation/widgets/custom_drawer.dart';
import '../widgets/search_widget/carts_custom_search_delegate_widget.dart';
import '../widgets/view_content_cart_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartsCubit cubit = sl<CartsCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const DrawerView(),
      body: BlocBuilder<CartsCubit, CartsState>(
        builder: (context, state) {
          return CustomLoadingWidget(
            inAsyncCall: state is GetAllProductsCartLoadingState,
            child: RefreshIndicator(
              onRefresh: () async =>
                  await cubit.get(context).getAllProductsInCart(),
              child: SizedBox(
                height: context.heightBodyWithNav,
                child: IntrinsicHeight(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                    child: SingleChildScrollView(
                      child: ViewContentCartScreen(cubit: cubit.get(context)),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(AppStrings.carts.tr()),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: CartsCustomSearchDelegate(cubit),
            );
          },
        ),
      ],
    );
  }
}

///

///

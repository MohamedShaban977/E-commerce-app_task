import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({Key? key, required this.subTitle})
      : super(key: key);
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(subTitle, //_cubit.get(context).product.description,
            style: context.displayMedium.copyWith(
              height: 1.5,
            )),
      ),
    );
  }
}

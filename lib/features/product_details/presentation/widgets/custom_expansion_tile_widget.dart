import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/color_manager.dart';

class CustomExpansionTileWidget extends StatelessWidget {
  const CustomExpansionTileWidget(
      {Key? key, required this.title, required this.children})
      : super(key: key);
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: ColorManager.lightGrey,
            width: 1.5,
          ),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          trailing: const Icon(
            Icons.arrow_drop_down,
            color: ColorManager.grey,
          ),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
          ),
          title: Text(
            title,
            style: context.displayMedium,
          ),
          children: children,
        ),
      ),
    );
  }
}

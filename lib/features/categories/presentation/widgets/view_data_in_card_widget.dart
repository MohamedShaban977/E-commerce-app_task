import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_image_network_view.dart';

class ViewDataInCardWidget extends StatelessWidget {
  const ViewDataInCardWidget({
    super.key,
    required this.pathUrl,
    required this.text,
  });

  final String pathUrl;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomViewImageNetwork(
          image: pathUrl,
          width: context.width,
          fit: BoxFit.fill,
        ),
        Container(
          alignment: Alignment.center,
          width: context.width,
          color: Colors.black26,
          child: Text(
            text,
            style: context.bodyLarge,
          ),
        ),
      ],
    );
  }
}

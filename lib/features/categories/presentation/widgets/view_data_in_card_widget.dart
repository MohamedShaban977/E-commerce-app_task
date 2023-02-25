import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';


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
        Image.network(
          pathUrl,
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
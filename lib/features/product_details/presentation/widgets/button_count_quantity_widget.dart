import 'package:flutter/material.dart';

import '../../../../core/app_manage/color_manager.dart';

class ButtonCountQuantity extends StatelessWidget {
  const ButtonCountQuantity(
      {Key? key,
      required this.onPressed,
      required this.icon,
      this.isRight = true,
      this.fillColor,
      this.isDisable = false})
      : super(key: key);
  final void Function()? onPressed;

  final bool isRight;

  final IconData icon;
  final Color? fillColor;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      width: 45.0,
      child: RawMaterialButton(
        fillColor:
            isDisable ? ColorManager.grey : fillColor ?? ColorManager.primary,
        onPressed: isDisable ? null : onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(isRight ? 8.0 : 0.0),
          topRight: Radius.circular(isRight ? 8.0 : 0.0),
          topLeft: Radius.circular(isRight ? 0.0 : 8.0),
          bottomLeft: Radius.circular(isRight ? 0.0 : 8.0),
        )),
        child: Icon(
          icon, // Icons.add,
          color: ColorManager.white,
        ),
      ),
    );
  }
}

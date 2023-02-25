import 'package:e_commerce_app_task/core/app_manage/color_manager.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.text,
      required this.colorText,
      required this.colorIcon,
      this.style})
      : super(key: key);
  final void Function() onPressed;
  final IconData icon;
  final String text;
  final Color colorText;
  final Color colorIcon;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        splashColor: ColorManager.secondary.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: colorIcon,
            ),
            const SizedBox(width: 11.0),
            Text(text,
                style: style?.copyWith(
                  color: colorText,
                )),
          ],
        ),
      ),
    );
  }
}

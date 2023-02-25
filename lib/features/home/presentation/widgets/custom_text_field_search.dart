import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_manage/strings_manager.dart';

class CustomTextFieldSearch extends StatelessWidget {
  const CustomTextFieldSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white60,
        prefixIcon: const Icon(Icons.search),
        hintText: AppStrings.hintSearchText.tr(),
        hintStyle: context.bodySmall,
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        disabledBorder: _buildOutlineInputBorder(),
        errorBorder: _buildOutlineInputBorder(),
        border: _buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}

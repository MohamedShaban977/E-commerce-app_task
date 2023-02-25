import 'package:flutter/material.dart';

import '../../../../core/app_manage/values_manager.dart';
import 'custom_text_field_search.dart';
import 'slider_widget.dart';

class TopScreenSearchAndSlider extends StatelessWidget {
  const TopScreenSearchAndSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
      child: Column(
        children: const [
          CustomTextFieldSearch(),
          SizedBox(height: AppSize.s11),
          SliderWidget(),
        ],
      ),
    );
  }
}

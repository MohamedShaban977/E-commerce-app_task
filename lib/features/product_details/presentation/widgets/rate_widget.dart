import 'package:e_commerce_app_task/core/app_manage/extension_manager.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/star_rating_widget.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({Key? key, required this.rate, this.style})
      : super(key: key);
  final String rate;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    double rating = double.parse(rate);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          rate,
          style: context.titleLarge,
        ),
        const SizedBox(width: 10.0),
        StatefulBuilder(builder: (context, setState) {
          return StarRating(
            rating: rating,
            onRatingChanged: (rate) => setState(() => rating = rate),
          );
        }),
      ],
    );
  }
}

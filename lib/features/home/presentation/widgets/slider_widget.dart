import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_task/core/locale/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/app_manage/values_manager.dart';
import '../cubit/home_cubit.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit().get(context);
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: cubit.imageSlider().length,
              itemBuilder: (_, itemIndex, i) => Image.asset(
                cubit.imageSlider()[itemIndex],
                fit: BoxFit.fill,
              ),
              options: CarouselOptions(
                aspectRatio: 2.4,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                onPageChanged: (index, _) {
                  cubit.onPageChanged(index);
                },
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: AppSize.s18),
            AnimatedSmoothIndicator(
              activeIndex: cubit.yourActiveIndex,
              count: cubit.imageSlider().length,
              effect: const ExpandingDotsEffect(
                dotHeight: AppSize.s4,
                dotWidth: AppSize.s8,
              ),
              textDirection:
                  context.isEnLocale ? TextDirection.ltr : TextDirection.rtl,
            ),
          ],
        );
      },
    );
  }
}

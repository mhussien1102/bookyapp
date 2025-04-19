import 'package:bookyapp/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

import 'custom_book_image_loading.dart';

class FeaturedListViewLoading extends StatelessWidget {
  const FeaturedListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomBookImageLoading(),
            );
          },
        ),
      ),
    );
  }
}

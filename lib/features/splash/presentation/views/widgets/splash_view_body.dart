import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image(image: AssetImage(AssetsData.logo)),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Read for free",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

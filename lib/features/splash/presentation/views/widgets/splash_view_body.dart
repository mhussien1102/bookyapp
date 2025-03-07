import 'package:bookyapp/features/splash/presentation/views/widgets/sliding_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../home/presentation/views/home.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    init_sliding_animation();
    navigator_home();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

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
        SlidingAnimation(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void init_sliding_animation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(5, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(() {
      setState(() {});
    });
  }

  void navigator_home() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return; // ✅ Check if the widget is still mounted
      GoRouter.of(context).push('/home');
    });
  }
}

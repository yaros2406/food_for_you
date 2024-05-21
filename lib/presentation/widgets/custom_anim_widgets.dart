import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class CustomLottieAnimation extends StatefulWidget {
  final String assetPath;
  final BoxFit fit;

  const CustomLottieAnimation({
    super.key,
    required this.assetPath,
    required this.fit,
  });

  @override
  CustomLottieAnimationState createState() => CustomLottieAnimationState();
}

class CustomLottieAnimationState extends State<CustomLottieAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.assetPath,
      controller: _animationController,
      onLoaded: (composition) {
        _animationController
          ..duration = composition.duration
          ..repeat();
      },
      fit: widget.fit,
    );
  }
}
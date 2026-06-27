import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLottie extends StatelessWidget {
  final String assetPath;
  final double height;
  final double width;
  final bool repeat;

  const AppLottie({
    super.key,
    required this.assetPath,
    this.height = 220,
    this.width = 220,
    this.repeat = true,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      assetPath,
      height: height,
      width: width,
      repeat: repeat,
      fit: BoxFit.contain,
    );
  }
}

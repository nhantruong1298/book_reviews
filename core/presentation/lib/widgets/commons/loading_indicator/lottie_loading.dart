import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:presentation/generated/assets.gen.dart';

class LottieLoading extends StatelessWidget {
  final double size;
  const LottieLoading({
    super.key,
    this.size = 300,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // return Lottie.asset(AssetsGen.getRawString(Assets.raws.appLoading),
    //     width: size, height: size);
  }
}

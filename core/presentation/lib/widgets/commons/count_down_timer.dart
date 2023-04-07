import 'package:flutter/material.dart';
import 'package:presentation/widgets/commons/typography/heading_text.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';


class CountdownTimer extends StatelessWidget {
  static const duration = Duration(seconds: 1);
  const CountdownTimer({
    super.key,
    this.controller,
    this.onFinished,
    this.seconds,
    this.textStyle,
  });
  final CountdownController? controller;
  final VoidCallback? onFinished;
  final int? seconds;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: seconds!,
      interval: duration,
      controller: controller!,
      onFinished: onFinished!,
      build: (BuildContext context, double time) =>
          _buildOTPCountDownText(time),
    );
  }

  Widget _buildOTPCountDownText(double time) {
    final minues = (time / 60).floor();
    final seconds = (time - minues * 60).toInt();

    return HeadingText(
      '(${minues > 9 ? minues : "0$minues"}:${seconds > 9 ? seconds : "0$seconds"})',
      style: textStyle ??
          HeadingText.defaultStyle.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';

class Tag extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color color;
  final Color borderColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  const Tag(
      {Key? key,
      required this.text,
      this.borderRadius,
      this.borderColor = AppColors.primaryDarkColor,
      this.color = AppColors.primaryLightColor,
      this.textStyle,
      this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: borderRadius ??
              BorderRadius.circular(AppDimensions.defaultRadius),
          color: color,
          border: Border.all(color: borderColor)),
      child: Text(
        text,
        style: textStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

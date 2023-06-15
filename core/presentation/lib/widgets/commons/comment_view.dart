import 'package:flutter/material.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_fonts.dart';
import 'package:presentation/widgets/commons/rating_stars.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

class CommentView extends StatelessWidget {
  final String? authorName;
  final String? comment;
  final String? timeLine;
  final int? stars;
  const CommentView({
    super.key,
    this.authorName,
    this.comment,
    this.timeLine,
    this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
            child: Assets.images.accountIcon.svg(
              width: 50,
              height: 50,
            ),
          ),
          const Spacing(1, direction: SpacingDirection.Horizontal),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                BodyLText(
                  authorName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: BodyLText.defaultStyle.copyWith(
                    color: AppColors.textGreyColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                RatingStars(
                  initValue: stars,
                  iconSize: 20.0,
                  spacing: 0.0,
                )
              ],
            ),
          ),
          BodySText(
            timeLine,
            color: AppColors.textGreyColor,
          )
        ],
      ),
      const Spacing(1),
      BodyLText(
        comment,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: BodyLText.defaultStyle.copyWith(
          color: AppColors.textGreyColor,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.Playfair,
          fontStyle: FontStyle.italic,
        ),
      ),
    ]);
  }
}
import 'package:flutter/material.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/rating_stars.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

class BookReviewScreen extends StatefulWidget {
  final String? bookID;
  const BookReviewScreen({
    super.key,
    this.bookID,
  });

  @override
  State<BookReviewScreen> createState() => _BookReviewScreenState();
}

class _BookReviewScreenState extends BaseScreenState<BookReviewScreen> {
  @override
  Widget builder(BuildContext context) {
    return BasicLayout(
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: BodyLText(
        'Nhận xét',
        style: BodyLText.defaultStyle.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      child: Column(children: [
        const _ReviewData(),
        const Spacing(1),
        _buildDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Icon(
                Icons.add_circle_outline_outlined,
                size: AppDimensions.defaultIconSizeSmall,
              ),
              const Spacing(
                .5,
                direction: SpacingDirection.Horizontal,
              ),
              BodyLText(
                'Thêm nhận xét',
                style: BodyLText.defaultStyle.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    size: AppDimensions.defaultIconSizeSmall,
                    color: AppColors.textGreyColor,
                  ))
            ],
          ),
        ),
        _buildDivider(),
      ]),
    );
  }

  Widget _buildDivider() => const SizedBox(
        height: 1,
        width: double.infinity,
        child: Divider(
          thickness: 1,
        ),
      );
}

class _ReviewData extends StatelessWidget {
  const _ReviewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimensions.defaultXSPadding),
      padding: const EdgeInsets.all(AppDimensions.defaultPadding),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(
            AppDimensions.defaultRadius,
          )),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '4.6 ',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BodySText(
                        '/5',
                        style: BodySText.defaultStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacing(.25),
                BodySText(
                  'Dựa trên 120 nhận xét',
                  style: BodySText.defaultStyle.copyWith(
                    color: AppColors.textGreyColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacing(1),
                RatingStars(
                  initValue: 4,
                  iconSize: 20.0,
                  spacing: 0,
                )
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BodySText(
                      '5 sao',
                      style: BodySText.defaultStyle.copyWith(
                        color: AppColors.textGreyColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacing(1, direction: SpacingDirection.Horizontal),
                    _RatingStarIndicator(),
                  ],
                ),
                const Spacing(.25),
                Row(
                  children: [
                    BodySText(
                      '4 sao',
                      style: BodySText.defaultStyle.copyWith(
                        color: AppColors.textGreyColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacing(1, direction: SpacingDirection.Horizontal),
                    _RatingStarIndicator(),
                  ],
                ),
                const Spacing(.25),
                Row(
                  children: [
                    BodySText(
                      '3 sao',
                      style: BodySText.defaultStyle.copyWith(
                        color: AppColors.textGreyColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacing(1, direction: SpacingDirection.Horizontal),
                    _RatingStarIndicator(),
                  ],
                ),
                const Spacing(.25),
                Row(
                  children: [
                    BodySText(
                      '2 sao',
                      style: BodySText.defaultStyle.copyWith(
                        color: AppColors.textGreyColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacing(1, direction: SpacingDirection.Horizontal),
                    _RatingStarIndicator(),
                  ],
                ),
                const Spacing(.25),
                Row(
                  children: [
                    BodySText(
                      '1 sao',
                      style: BodySText.defaultStyle.copyWith(
                        color: AppColors.textGreyColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacing(1, direction: SpacingDirection.Horizontal),
                    _RatingStarIndicator(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _RatingStarIndicator extends StatelessWidget {
  const _RatingStarIndicator();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            height: 8,
            decoration: BoxDecoration(
                color: AppColors.greyColor500,
                borderRadius: BorderRadius.circular(20)),
          ),
          Row(
            children: [
              Flexible(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                  )),
              Flexible(flex: 1, child: Container())
            ],
          )
        ],
      ),
    );
  }
}

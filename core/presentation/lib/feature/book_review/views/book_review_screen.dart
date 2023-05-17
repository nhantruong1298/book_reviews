import 'package:flutter/material.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_fonts.dart';
import 'package:presentation/utils/size_config.dart';
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
      title: BodyLText('Nhận xét',
          style: BodyLText.defaultStyle.copyWith(fontWeight: FontWeight.w700)),
      child: SingleChildScrollView(
        child: Column(children: [
          const _ReviewData(),
          const Spacing(1),
          _divider,
          const _AddReviewButton(),
          _divider,
          const Spacing(3),
          const _ReviewFilter(),
          const Spacing(1),
          const _ReviewList()
        ]),
      ),
    );
  }

  Widget get _divider => const SizedBox(
        height: 1.0,
        width: double.infinity,
        child: Divider(
          thickness: 1.5,
          color: AppColors.greyColor400,
        ),
      );
}

class _AddReviewButton extends StatelessWidget {
  final VoidCallback? onTap;
  const _AddReviewButton({
    // ignore: unused_element
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppDimensions.defaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
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
            const Icon(
              Icons.keyboard_arrow_right,
              size: AppDimensions.defaultIconSizeSmall,
              color: AppColors.textGreyColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewFilter extends StatelessWidget {
  const _ReviewFilter();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BodyLText(
          'Nhận xét',
          style: BodyLText.defaultStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.sort,
          size: AppDimensions.defaultIconSizeSmall,
        ),
        BodyLText(
          ' Gần đây ',
          style: BodyLText.defaultStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Icon(
          Icons.keyboard_arrow_down,
          size: AppDimensions.defaultIconSizeSmall,
        ),
      ],
    );
  }
}

class _ReviewList extends StatelessWidget {
  const _ReviewList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppDimensions.defaultXSPadding),
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (context, index) => const Spacing(1),
      itemBuilder: (context, index) {
        return SizedBox(
          width: SizeConfig.screenWidth,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.roundedRadius),
                  child: Assets.images.accountIcon.svg(
                    width: 50,
                    height: 50,
                  ),
                ),
                const Spacing(1, direction: SpacingDirection.Horizontal),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BodyMText(
                      'Zander Rohan',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: BodyMText.defaultStyle.copyWith(
                        color: AppColors.textGreyColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const RatingStars(
                        initValue: 5, iconSize: 15.0, spacing: 0.0)
                  ],
                )
              ],
            ),
            const Spacing(1),
            BodyMText(
              'To add custom fonts to your application, add a fonts section here,in this "flutter" section. Each entry in this list should have afamily key with the font family name, and a "fonts" key with alist giving the asset and other descriptors for the font. For',
              style: BodyMText.defaultStyle.copyWith(
                color: AppColors.textGreyColor,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.Playfair,
                fontStyle: FontStyle.italic,
              ),
            ),
          ]),
        );
      },
    );
  }
}

class _ReviewData extends StatelessWidget {
  const _ReviewData();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimensions.defaultXSPadding),
      padding: const EdgeInsets.all(AppDimensions.defaultPadding),
      decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(AppDimensions.defaultXLRadius)),
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
                      const Text(
                        '4.6 ',
                        style: TextStyle(
                          fontSize: AppDimensions.heading2FontSize,
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
                const RatingStars(
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
              children: List.generate(
                  5,
                  (index) => Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppDimensions.defaultXXSPadding),
                        child: Row(
                          children: [
                            BodySText(
                              '${5 - index} sao',
                              style: BodySText.defaultStyle.copyWith(
                                color: AppColors.textGreyColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacing(1,
                                direction: SpacingDirection.Horizontal),
                            _RatingStarIndicator(
                              currentStars: 100 - (index * 10),
                              totalStars: 100,
                            ),
                          ],
                        ),
                      )).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class _RatingStarIndicator extends StatelessWidget {
  final int totalStars;
  final int currentStars;
  const _RatingStarIndicator({
    required this.totalStars,
    required this.currentStars,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            height: AppDimensions.defaultXSPadding,
            decoration: BoxDecoration(
                color: AppColors.greyColor500,
                borderRadius:
                    BorderRadius.circular(AppDimensions.defaultXLRadius)),
          ),
          Row(
            children: [
              Flexible(
                  flex: currentStars,
                  child: Container(
                    width: double.infinity,
                    height: AppDimensions.defaultXSPadding,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(
                            AppDimensions.defaultXLRadius)),
                  )),
              Flexible(
                  flex: totalStars - currentStars,
                  child: const SizedBox.shrink())
            ],
          )
        ],
      ),
    );
  }
}

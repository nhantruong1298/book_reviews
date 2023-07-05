import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/generated/extension.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_fonts.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/comment_view.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:presentation/widgets/commons/typography/heading_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseScreenState<ProfileScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget builder(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const _Avarta(),
          const Spacing(1),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(
                  "Maya Maya",
                  style: HeadingText.defaultStyle.copyWith(
                    fontFamily: FontFamily.Playfair,
                  ),
                ),
                const Spacing(.25),
                BodyLText(
                  "@Mayamaya",
                  style: BodyLText.defaultStyle.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacing(1),
                BodyLText(
                  "I’m a freelance writer specializing in small business content. I’ve worked with companies in a variety of industries like home care to fine leather goods.",
                  style: BodyLText.defaultStyle.copyWith(),
                ),
                const Spacing(1),
                _divider,
                const Spacing(1),
                Row(
                  children: [
                    BodyLText(
                      '123',
                      style: BodyLText.defaultStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BodyLText(' likes'),
                    const Spacing(1, direction: SpacingDirection.Horizontal),
                    BodyLText(
                      '50',
                      style: BodyLText.defaultStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BodyLText(' reviews'),
                  ],
                ),
                const Spacing(0.5),
                Row(
                  children: [
                    _SocialIconButton(
                      icon: Assets.images.linkIcon.path,
                    ),
                    const Spacing(.75, direction: SpacingDirection.Horizontal),
                    _SocialIconButton(
                      icon: Assets.images.facebookIcon.path,
                    ),
                    const Spacing(.75, direction: SpacingDirection.Horizontal),
                    _SocialIconButton(
                      icon: Assets.images.twitterIcon.path,
                    ),
                    const Spacing(.75, direction: SpacingDirection.Horizontal),
                    _SocialIconButton(
                      icon: Assets.images.linkedInIcon.path,
                    )
                  ],
                ),
                const Spacing(1.5),
                _divider,
                const Spacing(1.5),
                BodyXLText(
                  'Nhận xét gần đây: ',
                  style: BodyXLText.defaultStyle.copyWith(
                    color: AppColors.textGreyColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.Playfair,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                          top: AppDimensions.defaultLPadding),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const CommentView(
                          authorName: 'Zander Rohan',
                          comment:
                              'To add custom fonts to your application, add a fonts section here,in this "flutter" section. Each entry in this list should have afamily key with the font family name, and a "fonts" key with alist giving the asset and other descriptors for the font. For',
                          stars: 5,
                          timeLine: '3 minutes ago',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Spacing(2);
                      },
                      itemCount: 10),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget get _divider => const SizedBox(
        height: 1.0,
        width: double.infinity,
        child: Divider(
          thickness: 1.5,
          color: AppColors.greyColor500,
        ),
      );
}

class _SocialIconButton extends StatelessWidget {
  final String? icon;
  final Color? color;
  // ignore: unused_element
  const _SocialIconButton({this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.defaultSPadding),
      child: SvgPicture.asset(
        AssetsGen.getRawString(icon ?? ''),
        width: AppDimensions.defaultIconSizeXS,
        height: AppDimensions.defaultIconSizeXS,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.defaultXSPadding),
          border: Border.all(
            color: AppColors.primaryDarkColor,
          )),
    );
  }
}

class _Avarta extends StatelessWidget {
  const _Avarta();

  @override
  Widget build(BuildContext context) {
    const dummyData =
        "https://firebasestorage.googleapis.com/v0/b/book-review-sandbox.appspot.com/o/maya.png?alt=media&token=19217ebf-365f-4e28-8405-adc4b95012f6";
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.getProportionateScreenHeight(200),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: SizeConfig.getProportionateScreenHeight(150),
            color: AppColors.greyColor400,
          ),
          Positioned(
            bottom: 0,
            left: AppDimensions.defaultPadding,
            child: Container(
              width: SizeConfig.getProportionateScreenWidth(120),
              height: SizeConfig.getProportionateScreenWidth(120),
              padding: const EdgeInsets.all(AppDimensions.defaultPadding),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.cyan.shade100,
                  border: Border.all(
                    width: 5,
                    color: Colors.white,
                  )),
              child: CachedNetworkImage(
                imageUrl: dummyData,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: AppDimensions.defaultPadding,
            child: Container(
              width: SizeConfig.getProportionateScreenWidth(120),
              height: SizeConfig.getProportionateScreenWidth(120),
              padding: const EdgeInsets.all(AppDimensions.defaultPadding),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    width: 5,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

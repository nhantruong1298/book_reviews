import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/generated/extension.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

class EditProfileScreenParams {
  final String? bio;
  final String? website;
  final String? fbLink;
  final String? twitterLink;

  EditProfileScreenParams(
      {this.bio, this.website, this.fbLink, this.twitterLink});
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _bioTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      automaticallyImplyLeading: true,
      resizeToAvoidBottomInset: true,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          BodyLText("Tiểu sử bản thân"),
          const Spacing(1),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryDarkColor,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
            ),
            padding: const EdgeInsets.all(AppDimensions.defaultPadding),
            child: TextFormField(
                maxLines: 10,
                maxLength: 500,
                autofocus: true,
                controller: _bioTextController,
                style: BodyMText.defaultStyle,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none)),
          ),
          const Spacing(2),
          BodyLText("Tài khoản xã hội"),
          const Spacing(1),
          Row(
            children: [
              SvgPicture.asset(
                AssetsGen.getRawString(Assets.images.linkIcon.path),
                width: 20,
                height: 20,
                fit: BoxFit.scaleDown,
              ),
              const Spacing(1, direction: SpacingDirection.Horizontal),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryDarkColor),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.defaultRadius),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.defaultPadding),
                    child: TextFormField(
                      maxLength: 100,
                      style: BodyMText.defaultStyle,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    )),
              ),
            ],
          ),
          const Spacing(1),
          Row(
            children: [
              SvgPicture.asset(
                AssetsGen.getRawString(Assets.images.facebookIcon.path),
                width: 20,
                height: 20,
                fit: BoxFit.scaleDown,
              ),
              const Spacing(1, direction: SpacingDirection.Horizontal),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryDarkColor),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.defaultRadius),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.defaultPadding),
                    child: TextFormField(
                      maxLength: 100,
                      style: BodyMText.defaultStyle,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    )),
              ),
            ],
          ),
          const Spacing(1),
          Row(
            children: [
              SvgPicture.asset(
                AssetsGen.getRawString(Assets.images.twitterIcon.path),
                width: 20,
                height: 20,
                fit: BoxFit.scaleDown,
              ),
              const Spacing(1, direction: SpacingDirection.Horizontal),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryDarkColor),
                      borderRadius:
                          BorderRadius.circular(AppDimensions.defaultRadius),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.defaultPadding),
                    child: TextFormField(
                      maxLength: 100,
                      style: BodyMText.defaultStyle,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                          counterText: "",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    )),
              ),
            ],
          ),
          // const Spacing(1),
          // Row(
          //   children: [
          //     SvgPicture.asset(
          //       AssetsGen.getRawString(Assets.images.linkedInIcon.path),
          //       width: 20,
          //       height: 20,
          //       fit: BoxFit.scaleDown,
          //     ),
          //     const Spacing(1, direction: SpacingDirection.Horizontal),
          //     Expanded(
          //       child: Container(
          //           decoration: BoxDecoration(
          //             border: Border.all(color: AppColors.primaryDarkColor),
          //             borderRadius:
          //                 BorderRadius.circular(AppDimensions.defaultRadius),
          //           ),
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: AppDimensions.defaultPadding),
          //           child: TextFormField(
          //             maxLength: 100,
          //             style: BodyMText.defaultStyle,
          //             textInputAction: TextInputAction.done,
          //             decoration: const InputDecoration(
          //                 counterText: "",
          //                 border: InputBorder.none,
          //                 enabledBorder: InputBorder.none,
          //                 focusedBorder: InputBorder.none),
          //           )),
          //     ),
          //   ],
          // )
        ]),
      ),
    );
  }
}

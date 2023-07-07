import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/model/user/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/feature/edit_profile/views/edit_profile_screen.dart';
import 'package:presentation/feature/profile/cubit/profile_cubit.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/generated/extension.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/utils/size_config.dart';
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

  ProfileCubit get profileCubit => BlocProvider.of<ProfileCubit>(context);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userInfo = context.read<AuthenticationCubit>().state.userInfo!;
      profileCubit.onScreenInit(userInfo);
    });
  }

  @override
  Widget builder(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.maybeWhen(
                loaded: (userInfo) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Avatar(
                          onTap: () {},
                        ),
                        const Spacing(1),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimensions.defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _buildUserName(userInfo),
                                  _buildEditButton()
                                ],
                              ),
                              const Spacing(1),
                              BodyLText(
                                "...",
                                style: BodyLText.defaultStyle.copyWith(),
                              ),
                              const Spacing(1),
                              _divider,
                              const Spacing(1),
                              Row(
                                children: [
                                  BodyLText(
                                    '0',
                                    style: BodyLText.defaultStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  BodyLText(' likes'),
                                  const Spacing(1,
                                      direction: SpacingDirection.Horizontal),
                                  BodyLText(
                                    '0',
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
                                  const Spacing(.5,
                                      direction: SpacingDirection.Horizontal),
                                  _SocialIconButton(
                                    icon: Assets.images.facebookIcon.path,
                                  ),
                                  const Spacing(.5,
                                      direction: SpacingDirection.Horizontal),
                                  _SocialIconButton(
                                    icon: Assets.images.twitterIcon.path,
                                  ),
                                  // const Spacing(.5,
                                  //     direction: SpacingDirection.Horizontal),
                                  // _SocialIconButton(
                                  //   icon: Assets.images.linkedInIcon.path,
                                  // )
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
                                  //fontFamily: FontFamily.Playfair,
                                ),
                              ),
                              Lottie.asset(
                                AssetsGen.getRawString(
                                    Assets.raws.emptyAnimation),
                                repeat: true,
                                width: double.infinity,
                                height: SizeConfig.screenHeight * 0.3,
                              ),
                            ],
                          ),
                        ),
                      ]);
                },
                loading: () => const SizedBox(),
                orElse: () => const SizedBox());
          },
        ),
      ),
    );
  }

  Widget _buildUserName(LoadUserInfoResult userInfo) {
    return Expanded(
      child: HeadingText(
        userInfo.displayName,
        style: HeadingText.defaultStyle.copyWith(),
      ),
    );
  }

  Material _buildEditButton() {
    return Material(
      borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
      child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
          onTap: () {
            final userInfo = 
            profileCubit.onEditProfilePressed();
          },
          child: const Padding(
            padding: EdgeInsets.all(AppDimensions.defaultSPadding),
            child: Icon(
              Icons.create,
              size: AppDimensions.defaultIconSizeSmall,
            ),
          )),
    );
  }

  void _goToEditProfileScreen() async {
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => EditProfileScreen()));
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
        color: AppColors.primaryLightColor,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.defaultXSPadding),
          color: AppColors.greyColor700,
          border: Border.all(
            color: AppColors.primaryLightColor,
          )),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String? photoUrl;
  final VoidCallback? onTap;
  const _Avatar({
    this.photoUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.getProportionateScreenHeight(200),
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              height: SizeConfig.getProportionateScreenHeight(150),
              color: AppColors.greyColor400),
          Positioned(
            bottom: 0,
            left: AppDimensions.defaultPadding,
            child: InkWell(
              onTap: onTap,
              child: Container(
                  width: SizeConfig.getProportionateScreenWidth(120),
                  height: SizeConfig.getProportionateScreenWidth(120),
                  padding: const EdgeInsets.all(AppDimensions.defaultPadding),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greyColor400,
                      border: Border.all(
                        width: 5,
                        color: Colors.white,
                      )),
                  child: (photoUrl != null)
                      ? CachedNetworkImage(
                          imageUrl: photoUrl!,
                          fit: BoxFit.fill,
                          errorWidget: (_, __, ___) => const SizedBox.shrink(),
                        )
                      : Icon(
                          Icons.add_a_photo,
                          size: SizeConfig.getProportionateScreenWidth(30),
                          color: AppColors.greyColor700,
                        )),
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

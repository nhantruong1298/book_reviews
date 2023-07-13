import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/feature/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/generated/extension.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/button/button.dart';
import 'package:presentation/widgets/commons/inputs/text_input_field.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

part 'edit_profile_listener.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends BaseScreenState<EditProfileScreen> {
  final String BIO_FIELD = 'bio';
  final String WEBSITE_FIELD = 'website';
  final String FACEBOOK_FIELD = 'facebook';
  final String TWITTER_FIELD = 'twitter';

  final _formKey = GlobalKey<FormBuilderState>();

  EditProfileCubit get editProfileCubit => context.read<EditProfileCubit>();

  @override
  Widget builder(BuildContext context) {
    final userInfo = context.read<AuthenticationCubit>().state.userInfo;

    return BasicLayout(
      automaticallyImplyLeading: true,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: AppButton(
        color: AppColors.primaryColor500,
        onPressed: () {
          final newBio =
              _formKey.currentState?.fields[BIO_FIELD]?.value as String;
          final newWebsite =
              _formKey.currentState?.fields[WEBSITE_FIELD]?.value as String;
          final newFacebookURL =
              _formKey.currentState?.fields[FACEBOOK_FIELD]?.value as String;

          final newTwitterURL =
              _formKey.currentState?.fields[TWITTER_FIELD]?.value as String;
              
          editProfileCubit.onSaveButtonPressed(
            userInfo!,
            newBio.trim(),
            newWebsite.trim(),
            newFacebookURL.trim(),
            newTwitterURL.trim(),
          );
        },
        text: "Xác nhận",
        textColor: AppColors.textLightColor,
      ),
      child: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            BodyLText("Tiểu sử bản thân"),
            const Spacing(1),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryDarkColor,
                  style: BorderStyle.solid,
                ),
                borderRadius:
                    BorderRadius.circular(AppDimensions.defaultRadius),
              ),
              padding: const EdgeInsets.all(AppDimensions.defaultPadding),
              child: TextInputField(
                  name: BIO_FIELD,
                  initialValue: userInfo?.bio ?? '',
                  maxLines: 10,
                  maxLength: 500,
                  autofocus: true,
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
            _SocialLinkTextField(
                name: WEBSITE_FIELD,
                initValue: userInfo?.website,
                icon: Assets.images.linkIcon.path),
            const Spacing(1),
            _SocialLinkTextField(
                name: FACEBOOK_FIELD,
                initValue: userInfo?.facebookURL,
                icon: Assets.images.facebookIcon.path),
            const Spacing(1),
            _SocialLinkTextField(
                name: TWITTER_FIELD,
                initValue: userInfo?.twitterURL,
                icon: Assets.images.twitterIcon.path),
            BlocListener<EditProfileCubit, EditProfileState>(
              listener: listener,
              child: const SizedBox.shrink(),
            )
          ]),
        ),
      ),
    );
  }
}

class _SocialLinkTextField extends StatelessWidget {
  final String? initValue;
  final String? icon;
  final String name;
  // ignore: unused_element
  const _SocialLinkTextField({this.icon, this.initValue, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AssetsGen.getRawString(icon!),
            width: AppDimensions.defaultIconSizeSmall,
            height: AppDimensions.defaultIconSizeSmall,
            fit: BoxFit.scaleDown),
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
              child: TextInputField(
                initialValue: initValue ?? '',
                name: name,
                maxLength: 100,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              )),
        ),
      ],
    );
  }
}

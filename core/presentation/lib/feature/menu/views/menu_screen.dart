import 'package:flutter/material.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/menu/views/menu_item.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_theme.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:presentation/widgets/commons/typography/heading_text.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => MenuScreenState();
}

class MenuScreenState extends BaseScreenState<MenuScreen> {
  bool _darkMode = false;

  @override
  Widget builder(BuildContext context) {
    return BasicLayout(
      bottomNavigationBar: const _LogoutButton(),
      title: HeadingText('Menu'),
      padding: EdgeInsets.zero,
      centerTitle: false,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _ShowProfileButton(),
        const Spacing(1),
        _divider,
        const Spacing(1),
        MenuItem(
          onTap: () {},
          icon: Assets.images.emailIcon.path,
          name: 'Email',
        ),
        const Spacing(1),
        MenuItem(
          onTap: () {},
          icon: Assets.images.notificationIcon.path,
          name: 'Thông báo',
        ),
        const Spacing(1),
        MenuItem(
          onTap: () {},
          icon: Assets.images.settingIcon.path,
          name: 'Cài đặt',
        ),
        const Spacing(1),
        _divider,
        const Spacing(1),
        MenuItem(
          onTap: () {},
          icon: Assets.images.userIcon.path,
          name: 'Cập nhật thông tin',
        ),
        const Spacing(1),
        _divider,
        MenuItem(
          icon: Assets.images.moonIcon.path,
          name: 'Dark mode',
          type: MenuToggleType(_darkMode, (newValue) {
            setState(() {
              _darkMode = newValue;
            });
          }),
        ),
      ]),
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

class _LogoutButton extends StatelessWidget {
  final VoidCallback? onTap;
  // ignore: unused_element
  const _LogoutButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.buttonHeight,
      margin: const EdgeInsets.only(
        bottom: AppDimensions.defaultPadding,
        left: AppDimensions.defaultPadding,
        right: AppDimensions.defaultPadding,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyColor500,
            width: 1.5,
          ),
          boxShadow: AppThemeStyle.appListTileBoxShadow,
          borderRadius: BorderRadius.circular(AppDimensions.defaultRadius)),
      child: Material(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
          onTap: onTap,
          child: Center(
              child: BodyLText(
            'Log out',
            style: BodyLText.defaultStyle.copyWith(
              fontWeight: FontWeight.w700,
            ),
          )),
        ),
      ),
    );
  }
}

class _ShowProfileButton extends StatelessWidget {
  final VoidCallback? onTap;
  // ignore: unused_element
  const _ShowProfileButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.only(left: AppDimensions.defaultPadding),
      onPressed: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
            child: Assets.images.accountIcon.svg(
              width: AppDimensions.defaultIconSizeLarge,
              height: AppDimensions.defaultIconSizeLarge,
            ),
          ),
          const Spacing(0.5, direction: SpacingDirection.Horizontal),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyLText(
                'Straw Hat',
                style: BodyLText.defaultStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              BodySText(
                'Xem thông tin của bạn',
                style: BodySText.defaultStyle.copyWith(
                  color: AppColors.textGreyColor,
                  height: 1,
                  fontSize: AppDimensions.descriptionFontSize,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

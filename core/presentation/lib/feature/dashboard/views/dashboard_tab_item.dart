import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/generated/extension.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/widgets/commons/layouts/tab_layout/fab_bottom_app_bar.dart';

class DashboardHomeTabItem extends FABBottomAppBarItem {
  static const index = 0;

  @override
  String? get title => 'Trang chủ';

  @override
  Widget get icon => SvgPicture.asset(
        AssetsGen.getRawString(Assets.images.homeIcon.path),
        width: inActiveIconSize,
        height: inActiveIconSize,
        color: AppColors.greyColor700,
      );

  @override
  Widget get activeIcon => SvgPicture.asset(
        AssetsGen.getRawString(Assets.images.homeIcon.path),
        width: inActiveIconSize,
        height: inActiveIconSize,
        color: AppColors.primaryColor500,
      );
}

class DashboardProfileTabItem extends FABBottomAppBarItem {
  static const index = 1;

  @override
  String? get title => 'Tôi';

  @override
  Widget get icon => SvgPicture.asset(
        AssetsGen.getRawString(Assets.images.profileIcon.path),
        width: inActiveIconSize,
        height: inActiveIconSize,
        color: AppColors.greyColor700,
      );

  @override
  Widget get activeIcon => SvgPicture.asset(
        AssetsGen.getRawString(Assets.images.profileIcon.path),
        width: inActiveIconSize,
        height: inActiveIconSize,
        color: AppColors.primaryColor500,
      );
}

class DashboardEventTabItem extends FABBottomAppBarItem {
  static const index = 2;

  @override
  String? get title => 'Sự kiện';

  @override
  Widget get icon => SvgPicture.asset(
        AssetsGen.getRawString(Assets.images.eventIcon.path),
        width: inActiveIconSize,
        height: inActiveIconSize,
        color: AppColors.greyColor700,
      );

  @override
  Widget get activeIcon => SvgPicture.asset(
        AssetsGen.getRawString(Assets.images.eventIcon.path),
        width: inActiveIconSize,
        height: inActiveIconSize,
        color: AppColors.primaryColor500,
      );
}

class DashboardMenuTabItem extends FABBottomAppBarItem {
  static const index = 3;

  @override
  String? get title => 'Menu';

  @override
  Widget get icon => SvgPicture.asset(
        AssetsGen.getRawString(Assets.images.menuIcon.path),
        width: inActiveIconSize,
        height: inActiveIconSize,
        color: AppColors.greyColor700,
      );

  @override
  Widget get activeIcon => SvgPicture.asset(
        AssetsGen.getRawString(Assets.images.menuIcon.path),
        width: inActiveIconSize,
        height: inActiveIconSize,
        color: AppColors.primaryColor500,
      );
}

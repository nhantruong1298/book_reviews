import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/dashboard/cubit/dashboard_cubit.dart';
import 'package:presentation/feature/menu/views/menu_screen.dart';
import 'package:presentation/feature/profile/views/profile_screen.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/generated/extension.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/layouts/tab_layout/tab_layout.dart';
part 'dashboard_listener.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends BaseScreenState<DashboardScreen>
    with TickerProviderStateMixin {
  late final List<Widget> _screens;
  DateTime? currentBackPressTime;
  late final TabController _controller;

  @override
  get willPop => false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      super.showSnackBar('',
          textColor: AppColors.textLightColor,
          duration: const Duration(seconds: 2),
          color: AppColors.primaryColor500.withOpacity(.8));
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeRoute.build(),
      const ProfileScreen(),
      BookEventRoute.build(),
      const MenuScreen(),
    ];

    _controller = TabController(
      length: _screens.length,
      vsync: this,
      initialIndex: 0,
    );

    //WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  List<FABBottomAppBarItem> get _navBarsItems {
    const double inActiveIconSize = 22;
    const double activeIconSize = 24;

    return [
      FABBottomAppBarItem(
        icon: SvgPicture.asset(
          AssetsGen.getRawString(Assets.images.homeIcon.path),
          width: inActiveIconSize,
          height: inActiveIconSize,
          color: AppColors.textGreyColor,
        ),
        activeIcon: SvgPicture.asset(
          AssetsGen.getRawString(Assets.images.homeIcon.path),
          width: activeIconSize,
          height: activeIconSize,
        ),
        title: 'Home',
      ),
      FABBottomAppBarItem(
        icon: SvgPicture.asset(
          AssetsGen.getRawString(Assets.images.profileIcon.path),
          width: inActiveIconSize,
          height: inActiveIconSize,
          color: AppColors.textGreyColor,
        ),
        activeIcon: SvgPicture.asset(
          AssetsGen.getRawString(Assets.images.profileIcon.path),
          width: activeIconSize,
          height: activeIconSize,
        ),
        title: 'Profile',
      ),
      FABBottomAppBarItem(
        icon: SvgPicture.asset(
          AssetsGen.getRawString(Assets.images.eventIcon.path),
          width: inActiveIconSize,
          height: inActiveIconSize,
          color: AppColors.textGreyColor,
        ),
        activeIcon: SvgPicture.asset(
          AssetsGen.getRawString(Assets.images.eventIcon.path),
          width: activeIconSize,
          height: activeIconSize,
        ),
        title: 'Event',
      ),
      FABBottomAppBarItem(
        icon: SvgPicture.asset(
          AssetsGen.getRawString(Assets.images.menuIcon.path),
          width: inActiveIconSize,
          height: inActiveIconSize,
          color: AppColors.textGreyColor,
        ),
        activeIcon: SvgPicture.asset(
          AssetsGen.getRawString(Assets.images.menuIcon.path),
          width: activeIconSize,
          height: activeIconSize,
        ),
        title: 'Menu',
      ),
    ];
  }

  @override
  Widget builder(BuildContext context) {
    SizeConfig.init(context);

    return BlocListener<DashboardCubit, DashboardState>(
      listener: listener,
      child: TabLayout(
        controller: _controller,
        darkMode: true,
        swipeable: false,
        appBarColor: AppColors.secondaryColor,
        headerVisible: false,
        color: AppColors.primaryLightColor,
        bottomAppBarColor: AppColors.textGreyColor,
        bottomAppBarActiveColor: AppColors.primaryColor500,
        items: _navBarsItems,
        screens: _screens,
      ),
    );
  }
}

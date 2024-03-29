import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/dashboard/cubit/dashboard_cubit.dart';
import 'package:presentation/feature/dashboard/views/dashboard_tab_item.dart';
import 'package:presentation/feature/menu/cubit/menu_cubit.dart';
import 'package:presentation/feature/menu/views/menu_item.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_fonts.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => MenuScreenState();
}

class MenuScreenState extends BaseScreenState<MenuScreen> {
  MenuCubit get menuCubit => BlocProvider.of<MenuCubit>(context);

  DashboardCubit get dashboardCubit => context.read<DashboardCubit>();

  @override
  Widget builder(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leadingWidth: double.infinity,
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        leading: _ShowProfileButton(
          onTap: () {
            dashboardCubit.onIndexChanged(DashboardProfileTabItem.index);
          },
        ),
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacing(.5),
          // MenuItem(
          //   onTap: () {},
          //   icon: Assets.images.orderIcon.path,
          //   name: 'Nhận xét của bạn',
          // ),
          // const Spacing(1),
          MenuItem(
            onTap: () {},
            icon: Assets.images.emailIcon.path,
            name: 'Email',
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
            icon: Assets.images.informationIcon.path,
            name: 'Thông tin ',
          ),
          const Spacing(1),
          MenuItem(
            onTap: _showSignOutDialog,
            icon: Assets.images.logoutIcon.path,
            name: 'Đăng xuất',
          ),
          const Spacing(1),
        ]),
      ),
    );
  }

  Widget get _divider => const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.defaultPadding),
        child: SizedBox(
          height: 1.0,
          width: double.infinity,
          child: Divider(
            thickness: 1.5,
            color: AppColors.greyColor500,
          ),
        ),
      );

  void _showSignOutDialog() async {
    final result = await showConfirmDialog(
        title: "Đăng xuất",
        oKText: "OK",
        cancelText: "Hủy",
        content: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyLText("Bạn muốn đăng xuất?"),
            ],
          ),
        ));
    if (result) {
      SignInRoute().go(context);
    }
  }
}

class _ShowProfileButton extends StatelessWidget {
  final VoidCallback? onTap;
  // ignore: unused_elementx
  const _ShowProfileButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.only(left: AppDimensions.defaultXSPadding),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BodyLText(
                '...',
                style: BodyLText.defaultStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1,
                  fontFamily: FontFamily.Playfair,
                ),
              ),
              const Spacing(0.25),
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

import 'package:flutter/material.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/loading_indicator/circular_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseScreenState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Future.delayed(const Duration(seconds: 2), () {

      // });
    });
  }

  @override
  Widget builder(BuildContext context) {
    return BasicLayout(
      color: AppColors.primaryColor500,
      automaticallyImplyLeading: false,
      headerVisible: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 2 * AppDimensions.defaultPadding,
                  vertical: AppDimensions.defaultPadding * 3),
              child: const CircularLoading()),
        ],
      ),
    );
  }
}

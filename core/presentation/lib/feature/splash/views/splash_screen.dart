import 'dart:convert';

import 'package:data/entity/response/book_detail_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/_global_app/cubit/global_app_cubit.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/utils/size_config.dart';
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
      Future.delayed(const Duration(seconds: 2), () {
        //context.goNamed(SignUpModule.routeName);
        //SignUpRoute().go(context);
        _loadMockData();
        DashboardRoute().go(context);
      });
    });
  }

  void _loadMockData() async {
    final jsonText = await rootBundle
        .loadString('packages/presentation/assets/mock_data/books_data.json');

    final List<dynamic> data = jsonDecode(jsonText);

    final List<BookDetailResponse> mockData = [];

    for (var item in data) {
      mockData.add(BookDetailResponse.fromJson(item));
    }

    context.read<GlobalAppCubit>().updateMockData(mockData);
  }

  @override
  Widget builder(BuildContext context) {
    SizeConfig.init(context);
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

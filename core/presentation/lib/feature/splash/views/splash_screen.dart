import 'dart:convert';

import 'package:data/entity/response/book_detail_response.dart';
import 'package:data/entity/response/event_detail_response.dart';
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
    _loadMockData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        DashboardRoute().go(context);
      });
    });
  }

  @override
  Widget builder(BuildContext context) {
    SizeConfig.init(context);
    return BasicLayout(
      color: AppColors.primaryColor500,
      appBarColor: AppColors.primaryColor500,
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

  void _loadMockData() async {
    //**Load book data */
    var jsonText = await rootBundle
        .loadString('packages/presentation/assets/mock_data/books_data.json');

    var jsonDecoded = jsonDecode(jsonText);

    final List<BookDetailResponse> bookData = [];

    for (var item in jsonDecoded) {
      bookData.add(BookDetailResponse.fromJson(item));
    }

    context.read<GlobalAppCubit>().updateMockDataForBook(bookData);

    //**Load event data */
    jsonText = await rootBundle
        .loadString('packages/presentation/assets/mock_data/events_data.json');

    jsonDecoded = jsonDecode(jsonText);

    final List<EventDetailResponse> eventData = [];

    for (var item in jsonDecoded) {
      eventData.add(EventDetailResponse.fromJson(item));
    }

    context.read<GlobalAppCubit>().updateMockDataForEvent(eventData);
  }
}

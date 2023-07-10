import 'package:domain/model/book/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/authentication/cubit/authentication_cubit.dart';
import 'package:presentation/feature/home/cubit/home_cubit.dart';
import 'package:presentation/feature/home/views/list_book_item.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/Spacing.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  @override
  bool get wantKeepAlive => true;

  HomeCubit get homeCubit => BlocProvider.of<HomeCubit>(context);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeCubit.onScreenInit();
    });
  }

  @override
  RefreshCallback? get onScreenRefresh => homeCubit.onScreenRefresh;

  @override
  Widget builder(BuildContext context) {
    final userInfo = context.read<AuthenticationCubit>().state.userInfo!;

    return BasicLayout(
        headerActions: _buildAppBarActions(),
        title: _buildAppBarTitle(userInfo.displayName ?? ''),
        centerTitle: false,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocBuilder<HomeCubit, HomeState>(builder: (_, state) {
            return state.maybeWhen(
                loaded: (trendingBooks, popularBooks) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ListBooksView(
                          title: "Thịnh hành",
                          data: trendingBooks,
                        ),
                        _ListBooksView(
                          title: "Đề xuất",
                          data: popularBooks,
                        ),
                      ]);
                },
                loading: () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ListBooksLoadingView(),
                        _ListBooksLoadingView(),
                      ],
                    ),
                orElse: () => const SizedBox());
          }),
        ));
  }

  List<Widget> _buildAppBarActions() {
    return [
      IconButton(onPressed: () {}, icon: Assets.images.notificationIcon.svg()),
      IconButton(
          onPressed: () {
            BookSearchRoute().push(context);
          },
          icon: Assets.images.searchIcon.svg())
    ];
  }

  Widget _buildAppBarTitle(String displayName) {
    return Row(
      children: [
        BodyLText(
          'Xin chào, ',
          style: BodyLText.defaultStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        BodyLText(
          displayName,
          style: BodyLText.defaultStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _ListBooksView extends StatelessWidget {
  final String title;
  final List<LoadBookResult> data;

  const _ListBooksView({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimensions.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyMText(title,
              style:
                  BodyMText.defaultStyle.copyWith(fontWeight: FontWeight.bold)),
          const Spacing(1),
          SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight * 0.3,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (_, __) =>
                  const Spacing(.75, direction: SpacingDirection.Horizontal),
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (_, index) {
                final book = data[index];

                return ListBookItem(
                  authorName: book.author,
                  bookName: book.name,
                  tags: book.tags ?? [],
                  onTap: () {
                    BookDetailRoute(book.id ?? '').go(context);
                  },
                  bookImage: book.image,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ListBooksLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimensions.defaultLPadding * 2.5),
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.screenHeight * 0.25,
        child: ListView.separated(
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) =>
              const Spacing(.75, direction: SpacingDirection.Horizontal),
          itemCount: 5,
          itemBuilder: (_, __) {
            return _buildItemLoadingView();
          },
        ),
      ),
    );
  }

  Widget _buildItemLoadingView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer(
          gradient: AppColors.loadingGradient,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppDimensions.defaultSRadius),
            ),
            width: SizeConfig.screenWidth * 0.3,
            height: SizeConfig.screenWidth * 0.4,
          ),
        ),
        const Spacing(0.5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer(
              gradient: AppColors.loadingGradient,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.defaultSRadius),
                ),
                width: SizeConfig.screenWidth * 0.2,
                height: SizeConfig.screenWidth * 0.03,
              ),
            ),
            const Spacing(0.25),
            Shimmer(
              gradient: AppColors.loadingGradient,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.defaultSRadius),
                ),
                width: SizeConfig.screenWidth * 0.3,
                height: SizeConfig.screenWidth * 0.03,
              ),
            ),
          ],
        )
      ],
    );
  }
}

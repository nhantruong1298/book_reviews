import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/constants/book_tag.dart';
import 'package:presentation/feature/home/cubit/home_cubit.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_fonts.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/Spacing.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

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
  Widget builder(BuildContext context) {
    return BasicLayout(
        headerActions: [
          IconButton(
              onPressed: () {}, icon: Assets.images.notificationIcon.svg()),
          IconButton(
              onPressed: () {
                BookSearchRoute().push(context);
              },
              icon: Assets.images.searchIcon.svg())
        ],
        title: Row(
          children: [
            BodyLText(
              'Welcome, ',
              style: BodyLText.defaultStyle.copyWith(
                fontFamily: FontFamily.Playfair,
                fontWeight: FontWeight.bold,
              ),
            ),
            BodyLText(
              'Spider Man',
              style: BodyLText.defaultStyle.copyWith(
                fontFamily: FontFamily.Playfair,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: false,
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing(1),
              _TrendingBooksView(),
              Spacing(1),
              _PopularBooksView()
            ],
          ),
        ));
  }
}

class _PopularBooksView extends StatelessWidget {
  const _PopularBooksView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadedState) {
          final popularBooks = state.popularBooks;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyMText(
                "Thông dụng",
                style: BodyMText.defaultStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacing(1),
              SizedBox(
                width: double.infinity,
                height: SizeConfig.screenHeight * 0.3,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const Spacing(
                    .75,
                    direction: SpacingDirection.Horizontal,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: popularBooks.length,
                  itemBuilder: (_, index) {
                    final book = popularBooks[index];

                    final bookTags = BookTagExtension.findTags(book.tag ?? []);

                    return ListBookItem(
                      authorName: book.author,
                      bookName: book.name,
                      tags: bookTags,
                      onTap: () {
                        BookDetailRoute(book.id ?? '').go(context);
                      },
                      bookImage: book.image,
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _TrendingBooksView extends StatelessWidget {
  const _TrendingBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyMText(
          "Trending",
          style: BodyMText.defaultStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacing(1),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadedState) {
              final trendingBooks = state.trendingBooks;
              return SizedBox(
                width: double.infinity,
                height: SizeConfig.screenHeight * 0.3,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const Spacing(
                    .75,
                    direction: SpacingDirection.Horizontal,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingBooks.length,
                  itemBuilder: (_, index) {
                    final book = trendingBooks[index];

                    final bookTags = BookTagExtension.findTags(book.tag ?? []);

                    return ListBookItem(
                      authorName: book.author,
                      bookName: book.name,
                      tags: bookTags,
                      onTap: () {
                        BookDetailRoute(book.id ?? '').go(context);
                      },
                      bookImage: book.image,
                    );
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}

class ListBookItem extends StatelessWidget {
  final VoidCallback? onTap;
  final List<BookTag> tags;
  final String? bookName;
  final String? authorName;
  final String? bookImage;

  const ListBookItem({
    super.key,
    required this.onTap,
    required this.bookName,
    required this.bookImage,
    required this.authorName,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDimensions.defaultSRadius),
      onTap: onTap,
      child: SizedBox(
        width: SizeConfig.screenWidth * 0.3,
        height: SizeConfig.screenWidth * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _BookImage(bookImage: bookImage),
            const Spacing(0.25),
            _BookInfo(
              authorName: authorName,
              bookName: bookName,
              tags: tags,
            )
          ],
        ),
      ),
    );
  }
}

class _BookImage extends StatelessWidget {
  final String? bookImage;
  const _BookImage({
    this.bookImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: _boxShadow,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: bookImage ?? '',
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: SizeConfig.screenWidth * 0.3,
            height: SizeConfig.screenWidth * 0.4,
            fit: BoxFit.cover,
          ),
        ));
  }
}

class _BookInfo extends StatelessWidget {
  final List<BookTag> tags;
  final String? bookName;
  final String? authorName;
  const _BookInfo({
    this.bookName,
    this.authorName,
    required this.tags,
  });

  //static const MAX_TAGS = 4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimensions.defaultXSPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BodyMText(
            bookName,
            style: BodyMText.defaultStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            authorName ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.textGreyColor,
              fontSize: AppDimensions.bodyXSFontSize,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacing(0.5),
          //_buildTags(),
        ],
      ),
    );
  }

//   Widget _buildTags() {
//     final listBookTag = tags.take(MAX_TAGS).toList();

//     return Row(
//       children: List.generate(listBookTag.length, (index) {
//         if (index == MAX_TAGS - 1) {
//           return const Tag(
//             text: '...',
//             borderColor: Colors.white,
//             textStyle: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           );
//         }

//         final bookTag = listBookTag[index];
//         return Flexible(
//           child: Padding(
//             padding: const EdgeInsets.only(right: 4),
//             child: Tag(
//               text: bookTag.value,
//               color: bookTag.color,
//               borderColor: bookTag.color,
//               textStyle: TextStyle(
//                   fontSize: BodyLText.defaultStyle.fontSize,
//                   color: AppColors.textLightColor,
//                   fontWeight: FontWeight.w700),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
}

List<BoxShadow> get _boxShadow => const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 3,
        spreadRadius: 0.1,
        offset: Offset(2, 1),
      ),
    ];

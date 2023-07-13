import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/constants/book_tag.dart';
import 'package:presentation/feature/book_detail/cubit/book_detail_cubit.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_fonts.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/comment_view.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/rating_stars.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/tag.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailScreen extends StatefulWidget {
  final String bookID;
  const BookDetailScreen({
    super.key,
    required this.bookID,
  });

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends BaseScreenState<BookDetailScreen> {
  BookDetailCubit get bookDetailCubit => context.read<BookDetailCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bookDetailCubit.onScreenInit();
    });
  }

  @override
  RefreshCallback? get onScreenRefresh => bookDetailCubit.onScreenRefresh;

  @override
  Widget builder(BuildContext context) {
    return BasicLayout(
        automaticallyImplyLeading: true,
        padding: const EdgeInsets.fromLTRB(
          2 * AppDimensions.defaultPadding,
          0,
          2 * AppDimensions.defaultPadding,
          1 * AppDimensions.defaultPadding,
        ),
        headerActions: _buildHeaderActions,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: BlocBuilder<BookDetailCubit, BookDetailState>(
            builder: (_, state) {
              return state.maybeWhen(
                  loaded: (loadBookResult) {
                    return Column(
                      children: [
                        const Spacing(1),
                        _BookImage(imageUrl: loadBookResult?.image ?? ''),
                        const Spacing(1),
                        _BookNameAndAuthor(
                            bookAuthor: loadBookResult?.author ?? '',
                            bookName: loadBookResult?.name ?? ''),
                        const Spacing(1),
                        RatingStars(
                          initValue: null,
                          onChanged: (value) {},
                        ),
                        const Spacing(2),
                        const SizedBox(
                            height: 1,
                            width: double.infinity,
                            child: Divider(thickness: 1)),
                        const Spacing(2),
                        _BookDescription(
                            description: loadBookResult?.description ?? ''),
                        const Spacing(2),
                        _BookTags(tags: loadBookResult?.tags ?? []),
                        const Spacing(2),
                        _buildListReview()
                      ],
                    );
                  },
                  loading: () => const _BookDetailLoadingView(),
                  orElse: () => const SizedBox());
            },
          ),
        ));
  }

  Widget _buildListReview() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyXLText(
              'Nhận xét : ',
              style: BodyXLText.defaultStyle.copyWith(
                color: AppColors.textGreyColor,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.Playfair,
              ),
            ),
            TextButton(
                onPressed: () {
                  BookReviewRoute(widget.bookID).go(context);
                },
                child: BodyXLText(
                  'Chi tiết',
                  style: BodyXLText.defaultStyle.copyWith(
                    color: AppColors.textGreyColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.Playfair,
                  ),
                ))
          ],
        ),
        const Spacing(1),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return SizedBox(
                width: SizeConfig.screenWidth,
                child: const CommentView(
                  authorName: 'Zander Rohan',
                  comment:
                      'To add custom fonts to your application, add a fonts section here,in this "flutter" section. Each entry in this list should have afamily key with the font family name, and a "fonts" key with alist giving the asset and other descriptors for the font. For',
                  stars: 5,
                  timeLine: '3 minutes ago',
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<Widget> get _buildHeaderActions {
    return [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline,
            color: AppColors.primaryDarkColor,
          ))
    ];
  }
}

class _BookTags extends StatelessWidget {
  final List<String> tags;
  const _BookTags({
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    final bookTags = BookTagExtension.findTags(tags);

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.start,
        runSpacing: AppDimensions.defaultXSPadding,
        children: List.generate(bookTags.length, (index) {
          return Padding(
            padding:
                const EdgeInsets.only(right: AppDimensions.defaultXSPadding),
            child: Tag(
              padding: const EdgeInsets.all(AppDimensions.defaultXSPadding),
              textStyle: TextStyle(
                fontSize: BodySText.defaultStyle.fontSize,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
              text: bookTags[index].value,
              color: AppColors.primaryLightColor,
              borderColor: AppColors.textColorDisabled,
              borderRadius: BorderRadius.circular(AppDimensions.defaultSRadius),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _BookDescription extends StatelessWidget {
  final String description;
  const _BookDescription({
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyMText(
          description,
          style: BodyMText.defaultStyle.copyWith(
            color: AppColors.textColor,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.Playfair,
          ),
        )
      ],
    );
  }
}

class _BookNameAndAuthor extends StatelessWidget {
  final String bookName;
  final String bookAuthor;
  const _BookNameAndAuthor({
    required this.bookName,
    required this.bookAuthor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          bookName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: FontFamily.Playfair,
            fontSize: AppDimensions.heading2FontSize * 1.25,
          ),
        ),
        BodyXLText(
          'by $bookAuthor',
          style: BodyLText.defaultStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.textGreyColor,
              fontFamily: FontFamily.Playfair),
        ),
      ],
    );
  }
}

class _BookImage extends StatelessWidget {
  final String imageUrl;
  const _BookImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.3,
      height: SizeConfig.getProportionateScreenHeight(160),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              spreadRadius: 0.1,
              offset: Offset(2, 1),
            )
          ],
          borderRadius: BorderRadius.circular(AppDimensions.defaultSRadius)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          )),
    );
  }
}

class _BookDetailLoadingView extends StatelessWidget {
  const _BookDetailLoadingView();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacing(1),
      Shimmer(
        gradient: AppColors.loadingGradient,
        child: Container(
          width: SizeConfig.screenWidth * 0.3,
          height: SizeConfig.getProportionateScreenHeight(160),
          decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius:
                  BorderRadius.circular(AppDimensions.defaultSRadius)),
        ),
      ),
      const Spacing(1),
      Shimmer(
          gradient: AppColors.loadingGradient,
          child: Container(
              width: SizeConfig.screenWidth * 0.8,
              height: SizeConfig.getProportionateScreenHeight(30),
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.defaultSRadius)))),
      const Spacing(.75),
      Shimmer(
          gradient: AppColors.loadingGradient,
          child: Container(
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.getProportionateScreenHeight(30),
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.defaultSRadius)))),
      const Spacing(.75),
      Shimmer(
          gradient: AppColors.loadingGradient,
          child: Container(
              width: SizeConfig.screenWidth * 0.6,
              height: SizeConfig.getProportionateScreenHeight(30),
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.defaultSRadius)))),
      const Spacing(3),
      const SizedBox(
        height: 1,
        width: double.infinity,
        child: Divider(
          thickness: 1,
        ),
      ),
      const Spacing(3),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer(
              gradient: AppColors.loadingGradient,
              child: Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.getProportionateScreenHeight(20),
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(
                          AppDimensions.defaultSRadius)))),
          const Spacing(0.75),
          Shimmer(
              gradient: AppColors.loadingGradient,
              child: Container(
                  width: SizeConfig.screenWidth * 0.6,
                  height: SizeConfig.getProportionateScreenHeight(20),
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(
                          AppDimensions.defaultSRadius)))),
          const Spacing(0.75),
          Shimmer(
              gradient: AppColors.loadingGradient,
              child: Container(
                  width: SizeConfig.screenWidth * 0.4,
                  height: SizeConfig.getProportionateScreenHeight(20),
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(
                          AppDimensions.defaultSRadius)))),
        ],
      ),
    ]);
  }
}

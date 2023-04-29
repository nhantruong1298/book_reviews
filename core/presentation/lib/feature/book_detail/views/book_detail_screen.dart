import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/constants/book_tag.dart';
import 'package:presentation/feature/_global_app/cubit/global_app_cubit.dart';
import 'package:presentation/feature/book_detail/cubit/book_detail_cubit.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_fonts.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/rating_stars.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/tag.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:presentation/widgets/commons/typography/heading_text.dart';

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
  Widget builder(BuildContext context) {
    final mockData = context.read<GlobalAppCubit>().state.mockData;

    final bookDetail =
        mockData?.firstWhereOrNull((item) => item.bookID == widget.bookID);

    return BasicLayout(
        automaticallyImplyLeading: true,
        padding: const EdgeInsets.fromLTRB(
          2 * AppDimensions.defaultPadding,
          0,
          2 * AppDimensions.defaultPadding,
          1 * AppDimensions.defaultPadding,
        ),
        headerActions: _buildHeaderActions,
        child: ListView(
          children: [
            Column(
              children: [
                const Spacing(1),
                _BookImage(
                  imageUrl: bookDetail?.linkImageBook ?? '',
                ),
                _BookNameAndAuthor(
                  bookAuthor: bookDetail?.bookAuthor ?? '',
                  bookName: bookDetail?.bookName ?? '',
                ),
                const Spacing(1),
                RatingStars(
                  initValue: bookDetail?.ratingStars,
                  onChanged: (value) {},
                ),
                const Spacing(2),
                const SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                const Spacing(2),
                _BookDescription(
                  description: bookDetail?.description ?? '',
                ),
                const Spacing(2),
                _BookTags(
                  tags: bookDetail?.tags ?? [],
                ),
              ],
            ),
          ],
        ));
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
            color: AppColors.textGreyColor,
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
        Heading1Text(
          bookName,
          textAlign: TextAlign.center,
          style: Heading1Text.defaultStyle.copyWith(
            fontFamily: FontFamily.Playfair,
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
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            // width: SizeConfig.screenWidth * 0.3,
            fit: BoxFit.cover,
            //height: SizeConfig.getProportionateScreenHeight(160)
          )),
    );
  }
}

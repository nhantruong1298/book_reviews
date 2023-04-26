import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:presentation/constants/book_tag.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/tag.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

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
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight * 0.18,
      margin:
          const EdgeInsets.symmetric(horizontal: AppDimensions.defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.defaultSRadius),
        boxShadow: _boxShadow,
      ),
      child: Material(
        color: const Color(0xFFF5CF85),
        borderRadius: BorderRadius.circular(AppDimensions.defaultSRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.defaultSRadius),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.defaultPadding),
            child: Row(
              children: [
                _BookImage(bookImage: bookImage),
                const Spacing(1, direction: SpacingDirection.Horizontal),
                _BookInfo(
                  authorName: authorName,
                  bookName: bookName,
                  tags: tags,
                )
              ],
            ),
          ),
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
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: 70,
              fit: BoxFit.cover,
              height: 100),
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

  static const MAX_TAGS = 4;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BodyLText(
            bookName,
            style: BodyLText.defaultStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          BodySText(
            authorName,
            style: BodySText.defaultStyle.copyWith(fontWeight: FontWeight.w500),
            maxLines: 1,
          ),
          const Spacing(0.5),
          _buildTags(),
        ],
      ),
    );
  }

  Widget _buildTags() {
    final listBookTag = tags.take(MAX_TAGS).toList();

    return Row(
      children: List.generate(listBookTag.length, (index) {
        if (index == MAX_TAGS - 1) {
          return const Tag(
            text: '...',
            borderColor: Colors.white,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          );
        }

        final bookTag = listBookTag[index];
        return Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Tag(
              text: bookTag.value,
              color: bookTag.color,
              borderColor: bookTag.color,
              textStyle: TextStyle(
                  fontSize: BodyLText.defaultStyle.fontSize,
                  color: AppColors.textLightColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
        );
      }).toList(),
    );
  }
}

List<BoxShadow> get _boxShadow => const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 3,
        spreadRadius: 0.1,
        offset: Offset(4, 2),
      )
    ];

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

class ListBookItem extends StatelessWidget {
  final VoidCallback? onTap;
  final List<String> tags;
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
  final List<String> tags;
  final String? bookName;
  final String? authorName;
  const _BookInfo({
    this.bookName,
    this.authorName,
    required this.tags,
  });

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

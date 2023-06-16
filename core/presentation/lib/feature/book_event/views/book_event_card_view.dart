part of 'book_event_screen.dart';

class _BookEventCardView extends StatelessWidget {
  const _BookEventCardView({
    this.eventName,
    this.imageUrl,
    this.dateStart,
    this.onTap,
  });

  final String? eventName;
  final String? imageUrl;
  final DateTime? dateStart;
  final VoidCallback? onTap;

  Widget get _divider => const SizedBox(
        height: 30,
        child: VerticalDivider(
          thickness: .75,
          color: AppColors.greyColor600,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: AppDimensions.defaultPadding),
          padding: const EdgeInsets.all(AppDimensions.defaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
              color: AppColors.backgroundColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3,
                  spreadRadius: 0.1,
                  offset: Offset(2, 1),
                ),
              ]),
          child: Column(
            children: [
              Row(
                children: [
                  _buildEventImage(),
                  const Spacing(1, direction: SpacingDirection.Horizontal),
                  _buildEventNameAndLocation(),
                  Column(
                    children: [
                      _buildEditButton(),
                      _buildLikeButton(),
                    ],
                  )
                ],
              ),
              const Spacing(1.5),
              Row(
                children: [
                  _buildLikesNumber(),
                  _divider,
                  _buildDateEvent(),
                  _divider,
                  _buildTimeEvent(),
                ],
              )
            ],
          )),
    );
  }

  Flexible _buildTimeEvent() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 3,
      child: Column(
        children: [
          BodyLText(
            '9:00 AM',
            style: BodyLText.defaultStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.Playfair,
            ),
          ),
          BodyText(
            'Thời gian',
            style: BodyText.defaultStyle.copyWith(
              color: AppColors.textGreyColor,
              fontSize: AppDimensions.bodyXXSFontSize,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Flexible _buildDateEvent() {
    return Flexible(
      flex: 2,
      fit: FlexFit.tight,
      child: Column(
        children: [
          BodyLText(
            DateFormatter.toDateAndMonthFormat(dateStart),
            style: BodyLText.defaultStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.Playfair,
            ),
          ),
          BodyText(
            'Ngày',
            style: BodyText.defaultStyle.copyWith(
              color: AppColors.textGreyColor,
              fontSize: AppDimensions.bodyXXSFontSize,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Flexible _buildLikesNumber() {
    return Flexible(
      flex: 2,
      fit: FlexFit.tight,
      child: Column(
        children: [
          BodyLText(
            '14',
            style: BodyLText.defaultStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.Playfair,
            ),
          ),
          BodyText(
            'Lượt thích',
            style: BodyText.defaultStyle.copyWith(
              color: AppColors.textGreyColor,
              fontSize: AppDimensions.bodyXXSFontSize,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildEventNameAndLocation() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyText(
          'SỰ KIỆN',
          color: AppColors.textGreyColor,
          style: BodyText.defaultStyle.copyWith(
            fontSize: AppDimensions.bodyXXSFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        BodyXLText(
          eventName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: BodyXLText.defaultStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.Playfair,
          ),
        ),
        const Spacing(.5),
        BodyText(
          'TP.HCM',
          style: BodyText.defaultStyle.copyWith(
            color: AppColors.textGreyColor,
            fontSize: AppDimensions.bodyXXSFontSize,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    ));
  }

  ClipRRect _buildEventImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.fill,
        width: SizeConfig.getProportionateScreenHeight(70),
        height: SizeConfig.getProportionateScreenHeight(70),
      ),
    );
  }

  Widget _buildLikeButton() {
    return InkWell(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.all(
            AppDimensions.defaultXXSPadding / 2,
          ),
          decoration: BoxDecoration(
              color: AppColors.greyColor300,
              borderRadius:
                  BorderRadius.circular(AppDimensions.defaultXSRadius)),
          child: const Icon(
            Icons.favorite_border,
            color: AppColors.textGreyColor,
            size: AppDimensions.defaultIconSizeSmall,
          )),
    );
  }

  Widget _buildEditButton() {
    return InkWell(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.all(
            AppDimensions.defaultXXSPadding / 2,
          ),
          decoration: BoxDecoration(
              color: AppColors.greyColor300,
              borderRadius:
                  BorderRadius.circular(AppDimensions.defaultXSRadius)),
          child: const Icon(
            Icons.more_vert,
            size: AppDimensions.defaultIconSizeSmall,
          )),
    );
  }
}

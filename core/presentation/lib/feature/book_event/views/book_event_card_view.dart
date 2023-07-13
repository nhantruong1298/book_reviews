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

  Widget get _verticalDivider => const SizedBox(
      height: 50,
      child: VerticalDivider(
        thickness: 1,
        color: AppColors.greyColor500,
      ));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.defaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
              border: Border.all(
                color: AppColors.greyColor500,
                width: 1,
              )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
              const SizedBox(
                width: double.infinity,
                height: AppDimensions.defaultLPadding,
                child: Divider(color: AppColors.greyColor500, thickness: 1),
              ),
              SizedBox(
                width: double.infinity,
                height: SizeConfig.getProportionateScreenHeight(50),
                child: Row(
                  children: [
                    _buildLikesNumber(),
                    _verticalDivider,
                    _buildDateEvent(),
                    _verticalDivider,
                    _buildTimeEvent(),
                  ],
                ),
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
    return IconButton(
      onPressed: () {},
      icon: Container(
          padding: const EdgeInsets.all(
            AppDimensions.defaultXSPadding / 2,
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
    return IconButton(
      onPressed: () {},
      icon: Container(
          padding: const EdgeInsets.all(
            AppDimensions.defaultXSPadding,
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

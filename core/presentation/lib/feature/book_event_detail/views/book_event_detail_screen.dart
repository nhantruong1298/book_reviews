import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:data/entity/response/event_detail_response.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/mock_data/mock_data.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/utils/date_formatter.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/button/button.dart';
import 'package:presentation/widgets/commons/button/button_type.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:presentation/widgets/commons/typography/heading_text.dart';

class BookEventDetailScreen extends StatefulWidget {
  final String? bookEventID;

  const BookEventDetailScreen({
    super.key,
    this.bookEventID,
  });

  @override
  State<BookEventDetailScreen> createState() => _BookEventDetailScreenState();
}

class _BookEventDetailScreenState
    extends BaseScreenState<BookEventDetailScreen> {
  @override
  Widget builder(BuildContext context) {
    final eventData = MockData.shared.eventData;

    final event =
        eventData?.firstWhereOrNull((item) => item.id == widget.bookEventID);

    

    return BasicLayout(
      automaticallyImplyLeading: true,
      bottomNavigationBar: const _BottomButton(),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _EventImage(event: event),
          const Spacing(1.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading2Text('${event?.eventName}'),
              const Spacing(1),
              const _PoweredBy(),
              const Spacing(1.5),
              _EventInfo(event: event),
              const Spacing(1.5),
              _EventTime(event: event),
              const Spacing(1),
            ],
          )
        ]),
      ),
    );
  }
}

class _EventTime extends StatelessWidget {
  const _EventTime({
    required this.event,
  });

  final EventDetailResponse? event;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BodyXSText(
          'Thời gian',
          style: BodyXSText.defaultStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        const Spacing(.5),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.defaultXSPadding,
            horizontal: AppDimensions.defaultLPadding,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.greyColor500,
                AppColors.greyColor400,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
          ),
          child: Row(children: [
            BodyXSText(
              'Bắt đầu',
              style: BodyXSText.defaultStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.access_time,
              size: AppDimensions.bodyXSFontSize,
            ),
            const Spacing(.5, direction: SpacingDirection.Horizontal),
            BodyXSText(
              DateFormatter.toFullDateTimeFormat(event?.dateStart),
              style: BodyXSText.defaultStyle.copyWith(),
            ),
          ]),
        ),
        const Spacing(.75),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.defaultXSPadding,
            horizontal: AppDimensions.defaultLPadding,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.greyColor500,
                AppColors.greyColor400,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
          ),
          child: Row(children: [
            BodyXSText(
              'Kết thúc',
              style: BodyXSText.defaultStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.access_time,
              size: AppDimensions.bodyXSFontSize,
            ),
            const Spacing(.5, direction: SpacingDirection.Horizontal),
            BodyXSText(
              DateFormatter.toFullDateTimeFormat(event?.dateStart),
              style: BodyXSText.defaultStyle.copyWith(),
            ),
          ]),
        ),
      ],
    );
  }
}

class _EventInfo extends StatelessWidget {
  const _EventInfo({
    required this.event,
  });

  final EventDetailResponse? event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BodyLText(
          'Thông tin',
          style: BodyLText.defaultStyle.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacing(1),
        BodyLText(
          event?.content,
          style: BodyLText.defaultStyle.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.textGreyColor,
          ),
        ),
      ],
    );
  }
}

class _PoweredBy extends StatelessWidget {
  const _PoweredBy();

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Được tổ chức bởi : ',
          style: BodyXLText.defaultStyle.copyWith(
            fontWeight: FontWeight.w500,
          )),
      TextSpan(
          text:
              'Cửa hàng sách NXB Trẻ, Thái Hà Books, Nhã Nam, Minh Long, Đinh Tị và Saigon Books',
          style: BodyXLText.defaultStyle.copyWith(
            fontWeight: FontWeight.w700,
          )),
    ]));
  }
}

class _EventImage extends StatelessWidget {
  const _EventImage({
    required this.event,
  });

  final EventDetailResponse? event;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.defaultPadding),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
            child: CachedNetworkImage(
              imageUrl: event?.imageUrl ?? '',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.35,
            ),
          ),
        ),
        _buildLocationIcon(),
        _buildDateIcon()
      ],
    );
  }

  Positioned _buildDateIcon() {
    return Positioned.fill(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.defaultXXSPadding,
                horizontal: AppDimensions.defaultLPadding,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColors.greyColor500,
                    AppColors.greyColor400,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                border:
                    Border.all(color: AppColors.primaryLightColor, width: 2.5),
                borderRadius:
                    BorderRadius.circular(AppDimensions.roundedRadius),
              ),
              child: BodyText(
                '12 May',
                style: BodyText.defaultStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: AppDimensions.bodyXSFontSize),
              )),
        ],
      ),
    );
  }

  Positioned _buildLocationIcon() {
    return Positioned(
        left: AppDimensions.defaultPadding,
        top: AppDimensions.defaultPadding,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.defaultXSPadding,
            horizontal: AppDimensions.defaultLPadding,
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.roundedRadius),
          ),
          child: Row(children: [
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.flag,
                size: AppDimensions.bodyXXSFontSize,
              ),
            ),
            BodyText(
              'TP.HCM',
              style: BodyText.defaultStyle.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: AppDimensions.bodyXXSFontSize,
              ),
            ),
          ]),
        ));
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: AppDimensions.defaultPadding,
        left: AppDimensions.defaultPadding,
        right: AppDimensions.defaultPadding,
      ),
      child: AppButton(
        color: AppColors.greyColor500,
        onPressed: () {},
        text: 'Đặt lịch',
        shape: AppButtonShape.Rounded,
      ),
    );
  }
}

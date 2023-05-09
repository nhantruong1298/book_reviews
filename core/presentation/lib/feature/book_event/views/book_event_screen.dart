import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/_global_app/cubit/global_app_cubit.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_theme.dart';
import 'package:presentation/utils/date_formatter.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

class BookEventScreen extends StatefulWidget {
  const BookEventScreen({super.key});

  @override
  State<BookEventScreen> createState() => _BookEventScreenState();
}

class _BookEventScreenState extends BaseScreenState<BookEventScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget builder(BuildContext context) {
    final eventData = context.read<GlobalAppCubit>().state.eventData ?? [];

    return BasicLayout(
      padding: EdgeInsets.zero,
      title: BodyXLText(
        'Sự kiện sách 2023',
        style: BodyXLText.defaultStyle.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: false,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: eventData.length,
        separatorBuilder: (_, __) => const Spacing(1),
        itemBuilder: (_, index) {
          final event = eventData[index];

          return _BookEventCardView(
            dateStart: event.dateStart,
            eventName: event.eventName,
            imageUrl: event.imageUrl,
            onTap: () {
              BookEventDetailRoute(event.id ?? '').go(context);
            },
          );
        },
      ),
    );
  }
}

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

  Widget get _divider => Container(
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
              boxShadow: [AppThemeStyle.defaultBoxShadow()]),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppDimensions.defaultRadius),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl ?? '',
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.fill,
                      width: SizeConfig.getProportionateScreenHeight(70),
                      height: SizeConfig.getProportionateScreenHeight(70),
                    ),
                  ),
                  const Spacing(
                    1,
                    direction: SpacingDirection.Horizontal,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyText(
                        'SỰ KIỆN',
                        color: AppColors.primaryColor500,
                        style: BodyText.defaultStyle.copyWith(
                          fontSize: AppDimensions.bodyXXSFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      BodyXLText(
                        eventName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: BodyXLText.defaultStyle
                            .copyWith(fontWeight: FontWeight.bold),
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
                  )),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.all(
                              AppDimensions.defaultXXSPadding / 2,
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.greyColor300,
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.defaultXSRadius)),
                            child: Icon(
                              Icons.more_vert,
                              size: AppDimensions.defaultIconSizeSmall,
                            )),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.all(
                              AppDimensions.defaultXXSPadding / 2,
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.greyColor300,
                                borderRadius: BorderRadius.circular(
                                    AppDimensions.defaultXSRadius)),
                            child: Icon(
                              Icons.favorite_border,
                              color: AppColors.primaryColor500,
                              size: AppDimensions.defaultIconSizeSmall,
                            )),
                      ),
                    ],
                  )
                ],
              ),
              const Spacing(1.5),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      children: [
                        BodyLText(
                          '14',
                          style: BodyLText.defaultStyle.copyWith(
                            fontWeight: FontWeight.w600,
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
                  ),
                  _divider,
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      children: [
                        BodyLText(
                          '${DateFormatter.toDateAndMonthFormat(dateStart)}',
                          style: BodyLText.defaultStyle.copyWith(
                            fontWeight: FontWeight.w600,
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
                  ),
                  _divider,
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Column(
                      children: [
                        BodyLText(
                          '9:00 AM',
                          style: BodyLText.defaultStyle.copyWith(
                            fontWeight: FontWeight.w600,
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
                  ),
                ],
              )
            ],
          )),
    );
  }
}

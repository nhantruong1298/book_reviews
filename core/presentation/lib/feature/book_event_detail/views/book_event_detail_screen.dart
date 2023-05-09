import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:data/entity/response/event_detail_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/_global_app/cubit/global_app_cubit.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_fonts.dart';
import 'package:presentation/utils/date_formatter.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/button/button.dart';
import 'package:presentation/widgets/commons/button/button_type.dart';
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
    final eventData = context.read<GlobalAppCubit>().state.eventData;

    final event =
        eventData?.firstWhereOrNull((item) => item.id == widget.bookEventID);

    return Scaffold(
      bottomNavigationBar: AppButton(
        type: AppButtonType.Primary,
        onPressed: () {},
        text: 'Đặt lịch',
      ),
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(event),
          SliverPadding(
            padding: const EdgeInsets.all(AppDimensions.defaultPadding),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading2Text(
                    'Sự kiện : ' '${event?.eventName}',
                    style: Heading2Text.defaultStyle.copyWith(
                      fontFamily: FontFamily.Playfair,
                    ),
                  ),
                  const Spacing(1),
                  BodyXLText(
                    'Bắt đầu vào : '
                    '${DateFormatter.toFullDateTimeFormat(event?.dateStart)}',
                    style: BodyLText.defaultStyle.copyWith(
                      fontFamily: FontFamily.Playfair,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacing(.25),
                  BodyXLText(
                    'Kết thúc vào : '
                    '${DateFormatter.toFullDateTimeFormat(event?.dateEnd)}',
                    style: BodyLText.defaultStyle.copyWith(
                      fontFamily: FontFamily.Playfair,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacing(1),
                  BodyLText(
                    event?.content,
                    style: BodyLText.defaultStyle.copyWith(
                      fontFamily: FontFamily.Playfair,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverPadding(
          //   padding: const EdgeInsets.all(AppDimensions.defaultPadding),
          //   sliver:
          // ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(EventDetailResponse? event) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      floating: true,
      automaticallyImplyLeading: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: AppColors.primaryDarkColor,
        tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        onPressed: Navigator.of(context).pop,
      ),
      expandedHeight: SizeConfig.getProportionateScreenHeight(150),
      backgroundColor: AppColors.backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.defaultXLRadius),
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: event?.imageUrl ?? '',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: SizeConfig.getProportionateScreenHeight(150),
                ),
              ),
              Positioned.fill(
                  child: Container(
                color: Colors.grey.withOpacity(0.3),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/_global_app/cubit/global_app_cubit.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/utils/date_formatter.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
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
      title: BodyXLText(
        'Sự kiện sách 2023',
        style: BodyXLText.defaultStyle.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: false,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultPadding,
      ),
      child: SingleChildScrollView(
          child: Column(
              children: List.generate(
        eventData.length,
        (index) {
          final event = eventData[index];

          return Padding(
            padding: const EdgeInsets.only(
              bottom: AppDimensions.defaultLPadding,
            ),
            child: _BookEventCardView(
              dateStart: event.dateStart,
              eventName: event.eventName,
              imageUrl: event.imageUrl,
              onTap: () {
                BookEventDetailRoute(event.id ?? '').go(context);
              },
            ),
          );
        },
      ))),
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.defaultRadius),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl ?? '',
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: double.infinity,
              height: SizeConfig.getProportionateScreenHeight(150),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.2),
                    Colors.white.withOpacity(.3),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )),
              ),
            ),
            Positioned(
                bottom: AppDimensions.defaultPadding,
                left: AppDimensions.defaultPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BodyLText(
                      eventName,
                      maxLines: 1,
                      style: BodyLText.defaultStyle.copyWith(
                        color: AppColors.textLightColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BodyLText(
                      DateFormatter.toFullDateTimeFormat(dateStart),
                      maxLines: 1,
                      style: BodyLText.defaultStyle.copyWith(
                        color: AppColors.textLightColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

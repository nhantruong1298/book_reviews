import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/feature/mock_data/mock_data.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/resources/app_fonts.dart';
import 'package:presentation/utils/date_formatter.dart';
import 'package:presentation/utils/size_config.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/spacing.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';

part 'book_event_card_view.dart';

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
    final eventData = MockData.shared.eventData ?? [];

    return BasicLayout(
      padding: EdgeInsets.zero,
      title: BodyXLText(
        'Sự kiện sách 2023',
        style: BodyXLText.defaultStyle.copyWith(
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.Playfair,
        ),
      ),
      centerTitle: false,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(
          AppDimensions.defaultPadding,
        ),
        shrinkWrap: true,
        itemCount: eventData.length,
        separatorBuilder: (_, __) => const Spacing(1.5),
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

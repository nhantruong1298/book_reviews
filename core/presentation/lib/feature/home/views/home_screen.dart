import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/constants/book_tag.dart';
import 'package:presentation/feature/_global_app/cubit/global_app_cubit.dart';
import 'package:presentation/feature/home/views/list_book_item.dart';
import 'package:presentation/widgets/commons/Spacing.dart';
import 'package:presentation/widgets/commons/button/button.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';
import 'package:presentation/widgets/commons/typography/body_text.dart';
import 'package:presentation/widgets/commons/typography/button_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget builder(BuildContext context) {
    final mockData = context.read<GlobalAppCubit>().state.mockData ?? [];

    return BasicLayout(
      title: BodyLText('Top Reviews 2023'),
      centerTitle: false,
      padding: EdgeInsets.zero,
      headerActions: [
        AppLinkButton(
          onPressed: () {
            BookSearchRoute().push(context);
          },
          child: const ButtonText('Tìm kiếm'),
        )
      ],
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: mockData.length,
        separatorBuilder: (_, __) => const Spacing(1),
        itemBuilder: (context, index) {
          final data = mockData[index];

          final bookTags = BookTagExtension.findTags(data.tags ?? []);

          return ListBookItem(
            authorName: data.bookAuthor,
            bookName: data.bookName,
            tags: bookTags,
            onTap: () {
              BookDetailRoute(data.bookID ?? '').go(context);
            },
            bookImage: data.linkImageBook,
          );
        },
      ),
    );
  }
}

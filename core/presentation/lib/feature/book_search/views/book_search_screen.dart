import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/app/route_builder.dart';
import 'package:presentation/base/base_screen.dart';
import 'package:presentation/constants/book_tag.dart';
import 'package:presentation/feature/book_search/cubit/book_search_cubit.dart';
import 'package:presentation/feature/home/views/home_screen.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/layouts/search_layout.dart';
import 'package:presentation/widgets/commons/spacing.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends BaseScreenState<BookSearchScreen> {
  BookSearchCubit get bookSearchCubit => context.read<BookSearchCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bookSearchCubit.onScreenInit();
    });
  }

  @override
  Widget builder(BuildContext context) {
    return SearchLayout(
      automaticallyImplyLeading: true,
      filters: const [],
      onSubmitted: (value) {
        bookSearchCubit.onSearchTextChanged(value);
      },
      child: BlocBuilder<BookSearchCubit, BookSearchState>(
        builder: (context, state) {
          if (state is BookSearchLoadedState) {
            final mockData = state.data;

            return ListView.separated(
              padding: const EdgeInsets.only(top: AppDimensions.defaultPadding),
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
                    BookDetailRoute(data.bookID ?? '').push(context);
                  },
                  bookImage: data.linkImageBook,
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

// class _TagsFilter extends StatelessWidget {
//   //final List<BookTag> tags;
//   final VoidCallback? onTap;
//   const _TagsFilter({
//     //this.tags = const [],
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BookSearchCubit, BookSearchState>(
//       builder: (context, state) {
//         //if (state is BookSearchLoadedState) {
//         final tags = state.searchData?.tags ?? [];

//         return SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: InkWell(
//             onTap: onTap,
//             child: Row(
//               children: [
//                 BodyLText('Tags : '),
//                 ...List.generate(tags.length, (index) {
//                   final tag = tags[index];
//                   return Tag(
//                     text: tag.label,
//                     color: tag.color,
//                   );
//                 })
//               ],
//             ),
//           ),
//         );
//         // }

//         // return const SizedBox.shrink();
//       },
//     );
//   }
// }

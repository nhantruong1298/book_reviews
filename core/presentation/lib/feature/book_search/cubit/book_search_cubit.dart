import 'package:bloc/bloc.dart';
import 'package:data/entity/response/book_detail_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/feature/book_search/book_search_data.dart';
import 'package:presentation/feature/mock_data/mock_data.dart';

part 'book_search_state.dart';
part 'book_search_cubit.freezed.dart';

class BookSearchCubit extends Cubit<BookSearchState> {
  BookSearchCubit() : super(BookSearchInitial(BookSearchData()));

  void _loadNewData(BookSearchData? searchData) {
    final mockData = MockData.shared.bookData ?? [];

    final List<BookDetailResponse> result = [];

    for (var data in mockData) {
      final bookName = (data.bookName ?? '').toLowerCase();
      final searchText = (searchData?.text ?? '').toLowerCase();

      if (!bookName.startsWith(searchText)) {
        continue;
      }

      result.add(data);
    }

    emit(BookSearchLoadedState(searchData, result));
  }

  // void onTagsChange(List<BookTag> tags) {
  //   final newSearchData = state.searchData?.copyWith(tags: tags);
  //   _loadNewData(newSearchData);
  // }

  void onSearchTextChanged(String text) {
    final newSearchData = state.searchData?.copyWith(text: text);
    _loadNewData(newSearchData);
  }

  void onScreenInit() {
    final mockData = MockData.shared.bookData ?? [];
    emit(BookSearchLoadedState(state.searchData, mockData));
  }
}

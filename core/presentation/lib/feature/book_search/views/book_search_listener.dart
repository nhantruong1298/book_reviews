part of 'book_search_screen.dart';

extension BookSearchListener on _BookSearchScreenState {
  void listener(BuildContext context, BookSearchState state) {
    state.maybeWhen(
        loading: (_) => toggleLoading(true, showSpinner: true),
        exception: (_, appException) {
          showErrorDialogByAppException(appException);
        },
        loaded: (_, __) {
           toggleLoading(false);
        },
        orElse: () {});
  }
}

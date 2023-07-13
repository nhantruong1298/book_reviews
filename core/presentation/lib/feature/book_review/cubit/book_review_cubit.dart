import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_review_state.dart';

class BookReviewCubit extends Cubit<BookReviewState> {
  BookReviewCubit() : super(BookReviewInitial());
}

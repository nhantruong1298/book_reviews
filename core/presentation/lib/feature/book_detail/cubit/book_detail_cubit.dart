import 'package:bloc/bloc.dart';
import 'package:data/entity/response/book_detail_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presentation/exception/app_exception.dart';
import 'package:presentation/feature/book_detail/book_detail_repository.dart';

part 'book_detail_state.dart';
part 'book_detail_cubit.freezed.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  final String bookID;
  final BookDetailRepository bookDetailRepository;

  BookDetailCubit(
    this.bookID,
    this.bookDetailRepository,
  ) : super(const BookDetailInitial());

  Future<void> onScreenInit(
    String bookID,
    List<BookDetailResponse>? mockData,
  ) async {}
}

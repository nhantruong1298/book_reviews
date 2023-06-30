import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_upload_state.dart';

class BookUploadCubit extends Cubit<BookUploadState> {
  BookUploadCubit() : super(BookUploadInitial());
}

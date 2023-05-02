part of 'global_app_cubit.dart';

// ignore: must_be_immutable
class GlobalAppState extends Equatable {
  List<BookDetailResponse>? bookData;
  List<EventDetailResponse>? eventData;

  GlobalAppState({
    this.bookData,
    this.eventData,
  });

  GlobalAppState copyWith({
    List<BookDetailResponse>? bookData,
    List<EventDetailResponse>? eventData,
  }) {
    return GlobalAppState(
      bookData: bookData ?? this.bookData,
      eventData: eventData ?? this.eventData,
    );
  }

  @override
  List<Object?> get props => [
        bookData,
        eventData,
      ];
}

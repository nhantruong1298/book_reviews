part of 'global_app_cubit.dart';

// ignore: must_be_immutable
class GlobalAppState extends Equatable {
  List<BookDetailResponse>? mockData;

  GlobalAppState({this.mockData});

  GlobalAppState copyWith({
    List<BookDetailResponse>? mockData,
  }) {
    return GlobalAppState(
      mockData: mockData ?? this.mockData,
    );
  }

  @override
  List<Object?> get props => [
        mockData,
      ];
}

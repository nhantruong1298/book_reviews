import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class BookTag {
  final String value;
  final String label;
  final Color color;

  BookTag._internal(
    this.value,
    this.label,
    this.color,
  );

  static final BEST_SELLER =
      BookTag._internal('best-seller', 'bán chạy', Colors.red);

  static final TOP_REVIEW =
      BookTag._internal('top-review', 'top review', Colors.yellow);

  static final SCAM = BookTag._internal('scam', 'scam', Colors.orange);

  static final BEHAVE = BookTag._internal('behave', 'ứng xử', Colors.grey);

  static final COMMUNICATE =
      BookTag._internal('communicate', 'giao tiếp', Colors.purple);

  static final SUCCESS =
      BookTag._internal('success', 'thành công', Colors.pink);

  static final MENTALITY =
      BookTag._internal('mentality', 'tâm lý', Colors.green);

  static final IT = BookTag._internal('IT', 'IT', Colors.blueGrey);

  static final PROGRAM =
      BookTag._internal('program', 'lập trình', Colors.lightBlue);

  static final LIFE_SKILLS =
      BookTag._internal('life-skills', 'kỹ năng sống', Colors.orangeAccent);

  static final PSYCHOLOGY =
      BookTag._internal('psychology', 'tâm lý học', Colors.lime);

  static final SELF_HELP =
      BookTag._internal('self-help', 'tự lực', Colors.cyan);

  static final List<BookTag> ITEMS = [
    BEST_SELLER,
    BEHAVE,
    COMMUNICATE,
    IT,
    PROGRAM,
    LIFE_SKILLS,
    MENTALITY,
    PSYCHOLOGY,
    SCAM,
    SUCCESS,
    SELF_HELP,
    TOP_REVIEW,
  ];
}

extension BookTagExtension on BookTag {
  static BookTag? findBookTag(String tag) {
    return BookTag.ITEMS.firstWhereOrNull((element) => element.value == tag);
  }

  static List<BookTag> findBookTags(List<String> tags) {
    final result = <BookTag>[];
    for (final tag in tags) {
      final bookTag = BookTag.ITEMS.firstWhereOrNull((element) => element.value == tag);
      if (bookTag == null) {
        continue;
      }

      result.add(bookTag);
    }
    return result;
  }
}

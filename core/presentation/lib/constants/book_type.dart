
class BookType {
  final String value;
  final String label;


  BookType._internal(this.value, this.label);

  static final BookType POLICICAL =
      BookType._internal('political', 'Chính trị');

  static final BookType LAW = BookType._internal('law', 'Luật');

  static final BookType SCIENCE =
      BookType._internal('science', 'Khoa học');

  static final BookType ECONOMY =
      BookType._internal('economy', 'Kinh tế');

  static final List<BookType> ITEMS = [
    POLICICAL,
    LAW,
    SCIENCE,
    ECONOMY,
  ];
}

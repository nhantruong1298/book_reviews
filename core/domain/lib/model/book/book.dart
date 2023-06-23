class LoadBookResult {
  final String? id;
  final String? name;
  final String? author;
  final String? image;
  final String? description;
  final List<String>? tag;
  final List<String>? reviewIDs;

  LoadBookResult({
    this.id,
    this.name,
    this.author,
    this.image,
    this.description,
    this.tag,
    this.reviewIDs,
  });
}

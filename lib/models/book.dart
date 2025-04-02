class Books {
  final String title;
  final String image;
  final String authors;
  final String description;
  final String rating;

  Books(this.title, this.image, this.authors, this.description, this.rating);

  factory Books.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] as Map<String, dynamic>;
    return Books(
        volumeInfo['title'] ?? "no title",
        volumeInfo['imageLinks']?['thumbnail'],
        (volumeInfo['authors'] as List<dynamic>?)?.join(" , ") ?? "unknown",
        volumeInfo['description'] ?? "no description available",
        (volumeInfo['averageRating'] as num?)?.toString() ?? "5");
  }
}

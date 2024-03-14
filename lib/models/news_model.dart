class News {
  final String title;
  final String imageUrl;
  final String description;
  final String url;

  News({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
    );
  }
}

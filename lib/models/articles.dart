import 'source.dart';

class Articles {
  const Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  final Source source;
  final String author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: Source.fromMap(json['source'] as Map<String, dynamic>),
      author: json['author'] as String,
      title: json['title'] as String,
      description:
          json['description'] != null ? json['description'] as String : null,
      url: json['url'] as String,
      urlToImage:
          json['urlToImage'] != null ? json['urlToImage'] as String : null,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] != null ? json['content'] as String : null,
    );
  }
}

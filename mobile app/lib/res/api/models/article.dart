import 'dart:convert';

Article articleFromJson(String data) => Article.fromJson(json.decode(data));
String articleToJson(Article data) => json.encode(data.toJson());
Article articlefromInternalDB(Map<String, dynamic> data) =>
    Article.fromInternalDB(data);

class Article {
  int? id;
  String sourceName;
  String title;
  String? sourceLink;
  String? sourceImageLink;
  String content;
  String shortDescription;
  List<String> references;

  Article(
      {this.id,
      required this.sourceName,
      required this.title,
      this.sourceImageLink,
      this.sourceLink,
      required this.content,
      required this.shortDescription,
      this.references = const []});
  factory Article.fromJson(Map<String, dynamic> json) => Article(
      id: json['id'],
      title: json['title'],
      sourceName: json['source_name'],
      sourceLink: json['source_link'],
      sourceImageLink: json['source_image_link'],
      content: json['content'],
      shortDescription: json['short_description'],
      references: json['references'] ?? []);
  factory Article.fromInternalDB(Map<String, dynamic> data) => Article(
      id: data['id'],
      title: data['title'],
      sourceName: data['source_name'],
      sourceLink: data['source_link'],
      sourceImageLink: data['source_image_link'],
      content: data['content'],
      shortDescription: data['short_description'],
      references: (data['article_references'] ?? "").split("&&&"));

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "source_name": sourceName,
        "source_link": sourceLink,
        "source_image_link": sourceImageLink,
        "content": content,
        "short_description": shortDescription,
        "references": references
      };

  Map<String, dynamic> toInternalDBMap() => {
        "id": id,
        "title": title,
        "source_name": sourceName,
        "source_link": sourceLink,
        "source_image_link": sourceImageLink,
        "content": content,
        "short_description": shortDescription,
        "article_references": references.join("&&&")
      };
}

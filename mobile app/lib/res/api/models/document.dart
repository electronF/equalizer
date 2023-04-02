import 'dart:convert';

Document documentFromJson(String data) => Document.fromJson(json.decode(data));
String documentToJson(Document data) => json.encode(data.toJson());
Document documentfromInternalDB(Map<String, dynamic> data) =>
    Document.fromInternalDB(data);

class Document {
  int? id;
  String type;
  String title;
  String? sourceLink;
  String? sourceImageLink;
  String shortDescription;

  Document({
    this.id,
    required this.title,
    required this.type,
    this.sourceImageLink,
    this.sourceLink,
    required this.shortDescription,
  });
  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json['id'],
        title: json['title'],
        type: json['type'],
        sourceLink: json['source_link'],
        sourceImageLink: json['source_image_link'],
        shortDescription: json['short_description'],
      );
  factory Document.fromInternalDB(Map<String, dynamic> data) => Document(
        id: data['id'],
        title: data['title'],
        type: data['type'],
        sourceLink: data['source_link'],
        sourceImageLink: data['source_image_link'],
        shortDescription: data['short_description'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "source_link": sourceLink,
        "source_image_link": sourceImageLink,
        "short_description": shortDescription,
      };

  Map<String, dynamic> toInternalDBMap() => {
        "id": id,
        "title": title,
        "type": type,
        "source_link": sourceLink,
        "source_image_link": sourceImageLink,
        "short_description": shortDescription,
      };
}

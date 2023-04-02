import 'dart:convert';

Organization organizationFromJson(String data) =>
    Organization.fromJson(json.decode(data));
String organizationToJson(Organization data) => json.encode(data.toJson());
Organization organizationfromInternalDB(Map<String, dynamic> data) =>
    Organization.fromInternalDB(data);

class Organization {
  int? id;
  String type;
  String name;
  String shortDescription;
  String fullDescription;
  String image;
  List<String> adresses;
  List<String> contacts;
  List<Map<String, String>> socialMedia;

  Organization(
      {this.id,
      required this.name,
      required this.type,
      required this.image,
      required this.shortDescription,
      required this.fullDescription,
      this.adresses = const [],
      this.contacts = const [],
      this.socialMedia = const []});
  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
      id: json['Id'],
      name: json['Name'],
      type: json['Type'],
      image: json['Image'],
      shortDescription: json['ShortDescription'],
      fullDescription: json['FullDescription'],
      adresses: json['Adresses'] ?? [],
      contacts: json['Contacts'] ?? [],
      socialMedia: json['SocialMedia'] ?? []);
  factory Organization.fromInternalDB(Map<String, dynamic> data) =>
      Organization(
        id: data['id'],
        name: data['name'],
        type: data['type'],
        image: data['image'],
        shortDescription: data['short_description'],
        fullDescription: data['full_description'],
        adresses: (data['adresses'] ?? "").split('&&&'),
        contacts: (data['contacts'] ?? "").split("&&&"),
        socialMedia: extractListOfSocialMedia(data['social_media'] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Type": type,
        "Image": image,
        "ShortDescription": shortDescription,
        "FullDescription": fullDescription,
        "Adresses": adresses,
        "Contacts": contacts,
        "SocialMedia": socialMedia
      };

  Map<String, dynamic> toInternalDBMap() => {
        "id": id,
        "name": name,
        "type": type,
        "image": image,
        "short_description": shortDescription,
        "full_description": fullDescription,
        "adresses": adresses,
        "contacts": contacts,
        "social_media": socialMedia
            .map((e) => ("${e['media'] ?? ""}|${e['link'] ?? ""}"))
            .join("&&&")
      };
}

List<Map<String, String>> extractListOfSocialMedia(String text) {
  List<Map<String, String>> children = [];

  for (var part in text.split("&&&")) {
    String media = "default";
    String link = "";
    List<String> sections = part.split("|");
    if (sections.length > 2) {
      media = sections[0];
      link = sections[1];
    }
    children.add({"media": media, 'link': link});
  }
  return children;
}

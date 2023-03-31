import 'dart:convert';

Message messageFromJson(String data) => Message.fromJson(json.decode(data));
String messageToJson(Message data) => json.encode(data.toJson());
Message messagefromInternalDB(Map<String, dynamic> data) =>
    Message.fromInternalDB(data);

class Message {
  int? id;
  String dateTime;
  String senderId;
  String? text;
  String? imagePath;
  String? videoPath;
  String? audioPath;
  String? documentPath;

  Message(
      {this.id,
      required this.senderId,
      this.text,
      required this.dateTime,
      this.imagePath,
      this.videoPath,
      this.audioPath,
      this.documentPath});
  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json['Id'],
        dateTime: json['DateTime'],
        senderId: json['SenderId'],
        text: json['Text'],
        imagePath: json['ImagePath'],
        videoPath: json['VideoPath'],
        audioPath: json['AudioPath'],
        documentPath: json['AudioPath'],
      );
  factory Message.fromInternalDB(Map<String, dynamic> data) => Message(
        id: data['id'],
        dateTime: data['datetime'],
        senderId: data['sender_id'],
        text: data['text'],
        imagePath: data['image_path'],
        videoPath: data['video_path'],
        audioPath: data['audio_path'],
        documentPath: data['document_path'],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "SenderId": senderId,
        "DateTime": dateTime,
        "Text": text,
        "AudioPath": audioPath,
        "DocumentPath": documentPath,
        "ImagePath": imagePath,
        "VideoPath": videoPath,
      };

  Map<String, dynamic> toInternalDBMap() => {
        'id': id,
        'datetime': dateTime,
        'sender_id': senderId,
        'text': text,
        'audio_path': audioPath,
        'document_path': documentPath,
        'image_path': imagePath,
        'video_path': videoPath,
      };
}

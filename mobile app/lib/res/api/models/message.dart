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
        dateTime: json['datetime'],
        senderId: json['sender_id'],
        text: json['text'],
        imagePath: json['image_path'],
        videoPath: json['video_path'],
        audioPath: json['audio_path'],
        documentPath: json['audio_path'],
      );
  factory Message.fromInternalDB(Map<String, dynamic> data) => Message(
        id: data['id'],
        dateTime: data['datetime'],
        senderId: data['sender_id'],
        text: data['text_content'],
        imagePath: data['image_path'],
        videoPath: data['video_path'],
        audioPath: data['audio_path'],
        documentPath: data['document_path'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sender_id": senderId,
        "datetime": dateTime,
        "text": text,
        "audio_path": audioPath,
        "document_path": documentPath,
        "image_path": imagePath,
        "video_path": videoPath,
      };

  Map<String, dynamic> toInternalDBMap() => {
        'id': id,
        'datetime': dateTime,
        'sender_id': senderId,
        'text_content': text,
        'audio_path': audioPath,
        'document_path': documentPath,
        'image_path': imagePath,
        'video_path': videoPath,
      };
}

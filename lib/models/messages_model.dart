// To parse this JSON data, do
//
//     final messageViewModel = messageViewModelFromJson(jsonString);

import 'dart:convert';

List<MessageViewModel> messageViewModelFromJson(String str) =>
    List<MessageViewModel>.from(
        json.decode(str).map((x) => MessageViewModel.fromJson(x)));

String messageViewModelToJson(List<MessageViewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageViewModel {
  MessageViewModel({
    this.from,
    this.timeStamp,
    this.message,
    this.images,
    this.type,
    this.dateTime,
    this.to,
  });

  final String? from;
  final String? timeStamp;
  final String? message;
  final List<String>? images;
  final String? type;
  final String? dateTime;
  final String? to;

  factory MessageViewModel.fromJson(Map<String, dynamic> json) =>
      MessageViewModel(
        from: json["from"] == null ? null : json["from"]!,
        timeStamp: json["timeStamp"] == null ? null : json["timeStamp"]!,
        message: json["message"] == null ? null : json["message"]!,
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        type: json["type"] == null ? null : json["type"]!,
        dateTime: json["dateTime"] == null ? null : json["dateTime"]!,
        to: json["to"] == null ? null : json["to"]!,
      );

  Map<String, dynamic> toJson() => {
        "from": from == null ? null : from!,
        "timeStamp": timeStamp == null ? null : timeStamp!,
        "message": message == null ? null : message!,
        "images":
            images == null ? null : List<String>.from(images!.map((x) => x)),
        "type": type == null ? null : type!,
        "dateTime": dateTime == null ? null : dateTime!,
        "to": to == null ? null : to!,
      };
}

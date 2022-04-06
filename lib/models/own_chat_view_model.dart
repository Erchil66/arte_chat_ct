import 'dart:convert';

List<ChatModelView> chatModelViewFromJson(String str) =>
    List<ChatModelView>.from(
        json.decode(str).map((x) => ChatModelView.fromJson(x)));

String chatModelViewToJson(List<ChatModelView> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModelView {
  ChatModelView({
    this.firstname,
    this.receiver,
    this.typeRoom,
    this.username,
    this.lastname,
    this.participants,
  });

  final String? firstname;
  final String? receiver;
  final String? typeRoom;
  final String? username;
  final String? lastname;
  final String? participants;

  factory ChatModelView.fromJson(Map<String, dynamic> json) => ChatModelView(
        firstname: json["firstname"] == null ? null : json["firstname"]!,
        receiver: json["receiver"] == null ? null : json["receiver"]!,
        typeRoom: json["type_room"] == null ? null : json["type_room"]!,
        username: json["username"] == null ? null : json["username"]!,
        lastname: json["lastname"] == null ? null : json["lastname"]!,
        participants:
            json["participants"] == null ? null : json["participants"]!,
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname == null ? null : firstname!,
        "receiver": receiver == null ? null : receiver!,
        "type_room": typeRoom == null ? null : typeRoom!,
        "username": username == null ? null : username!,
        "lastname": lastname == null ? null : lastname!,
        "participants": participants == null ? null : participants!,
      };
}

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.details,
    this.photos,
    this.active,
    this.online,
    this.email,
    this.userUid,
    this.username,
  });

  final Details? details;
  final List<String>? photos;
  final String? active;
  final String? online;
  final String? email;
  final String? userUid;
  final String? username;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        details:
            json["details"] == null ? null : Details.fromJson(json["details"]),
        photos: json["photos"] == null
            ? null
            : List<String>.from(json["photos"].map((x) => x)),
        active: json["active"] == null ? null : json["active"]!,
        online: json["online"] == null ? null : json["online"]!,
        email: json["email"] == null ? null : json["email"]!,
        userUid: json["user_uid"] == null ? null : json["user_uid"]!,
        username: json["username"] == null ? null : json["username"]!,
      );

  Map<String, dynamic> toJson() => {
        "details": details == null ? null : details!.toJson(),
        "photos":
            photos == null ? null : List<dynamic>.from(photos!.map((x) => x)),
        "active": active == null ? null : active!,
        "online": online == null ? null : online!,
        "email": email == null ? null : email!,
        "user_uid": userUid == null ? null : userUid!,
        "username": username == null ? null : username!,
      };
}

class Details {
  Details({
    this.firstname,
    this.lastname,
    this.age,
    this.address,
    this.profilePic,
  });

  final String? firstname;
  final String? lastname;
  final String? age;
  final String? address;
  final String? profilePic;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        firstname: json["firstname"] == null ? null : json["firstname"]!,
        lastname: json["lastname"] == null ? null : json["lastname"]!,
        age: json["age"] == null ? null : json["age"]!,
        address: json["address"] == null ? null : json["address"]!,
        profilePic: json["profilePic"] == null ? null : json["profilePic"]!,
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname == null ? null : firstname!,
        "lastname": lastname == null ? null : lastname!,
        "age": age == null ? null : age!,
        "address": address == null ? null : address!,
        "profilePic": profilePic == null ? null : profilePic!,
      };
}

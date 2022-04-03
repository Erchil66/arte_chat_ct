// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.details,
    this.photo,
    this.email,
    this.userUid,
    this.username,
  });

  final Details? details;
  final List<String>? photo;
  final String? email;
  final String? userUid;
  final String? username;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        details:
            json["details"] == null ? null : Details.fromJson(json["details"]),
        photo: json["photo"] == null
            ? null
            : List<String>.from(json["photo"].map((x) => x)),
        email: json["email"] == null ? null : json["email"]!,
        userUid: json["user_uid"] == null ? null : json["user_uid"]!,
        username: json["username"] == null ? null : json["username"]!,
      );

  Map<String, dynamic> toJson() => {
        "details": details == null ? null : details!.toJson(),
        "photo":
            photo == null ? null : List<dynamic>.from(photo!.map((x) => x)),
        "email": email == null ? null : email!,
        "user_uid": userUid == null ? null : userUid!,
        "username": username == null ? null : username!,
      };
}

class Details {
  Details({
    this.address,
    this.age,
    this.firstname,
    this.lastname,
    this.profilePic,
  });

  final String? address;
  final String? age;
  final String? firstname;
  final String? lastname;
  final String? profilePic;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        address: json["address"] == null ? null : json["address"]!,
        age: json["age"] == null ? null : json["age"]!,
        firstname: json["firstname"] == null ? null : json["firstname"]!,
        lastname: json["lastname"] == null ? null : json["lastname"]!,
        profilePic: json["profilePic"] == null ? null : json["profilePic"]!,
      );

  Map<String, dynamic> toJson() => {
        "address": address == null ? null : address,
        "age": age == null ? null : age,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "profilePic": profilePic == null ? null : profilePic,
      };
}

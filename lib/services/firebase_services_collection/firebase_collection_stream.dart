import 'dart:developer';

import 'package:chat/models/messages_model.dart';
import 'package:chat/models/own_chat_view_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CollectionFireStore {
  static final CollectionReference collectionReferenceUsers =
      Firebaseconstant.firestore.collection("users");
  static final CollectionReference collectionChat =
      Firebaseconstant.firestore.collection("chats_rooms");
  // static Future<CollectionReference> AddCollection() async => Firebaseconstant.firestore.collection("users");

}

class Firebaseconstant {
  //
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static addUserDetail({
    String? uid,
    String? username,
    String? email,
  }) async {
    final data = {
      "details": {
        "firstname": "",
        "lastname": "",
        "age": "",
        "address": "",
        "profilePic": ""
      },
      "photos": [],
      "active": "1",
      "online": "false",
      "email": email!,
      "user_uid": uid!,
      "username": username ?? ""
    };
    final result =
        await CollectionFireStore.collectionReferenceUsers.doc(uid).set(data);
    return result;
  }

  static addUsertoChat(
      {String? uidofUser,
      String? ownUID,
      String? username,
      String? firstname,
      String? lastname,
      String? type}) async {
    // type = 0 - individual type = 1 groups
    final dataMap = {
      "participants": "$uidofUser,$ownUID",
      "username": username ?? "",
      "firstname": firstname ?? "",
      "lastname": lastname ?? "",
      "receiver": ownUID,
      "type_room": type,
    };

    final datasayHello = {
      "from": ownUID,
      "timeStamp": DateTime.now().millisecondsSinceEpoch.toString(),
      "message": "Hi! want to chat",
      "images": [],
      "type": "",
      "dateTime": DateFormat("d MMM yyyy").add_jms().format(DateTime.now()),
      "to": uidofUser
    };
    await CollectionFireStore.collectionChat
        .doc("$uidofUser-$ownUID")
        .set(dataMap);
    // From Here
    // Make a path
    CollectionFireStore.collectionChat
        .doc("$uidofUser-$ownUID")
        .collection("messages")
        .add(datasayHello);
  }

  static sendMessage(
      {String? userUid,
      String? chatRoomId,
      String? message,
      List<String>? images}) async {
    final data = {
      "from": firebaseAuth.currentUser!.uid,
      "timeStamp": DateTime.now().millisecondsSinceEpoch.toString(),
      "message": message,
      "images": [],
      "type": "",
      "dateTime": DateFormat("d MMM yyyy").add_jms().format(DateTime.now()),
      "to": userUid
    };

    await CollectionFireStore.collectionChat
        .doc(chatRoomId!)
        .collection("messages")
        .add(data);
  }

  ////////////////////////////////////////////////////FOR MODELS//////////////////////////////////////////////

  static getSingleName(String? uid) async {
    final result =
        await CollectionFireStore.collectionReferenceUsers.doc(uid).get();
    final response = result.data() as Map<String, dynamic>;
    return response['username'].toString();
  }

  static Future<UserModel> getUserData(String? uid) async {
    final list =
        await CollectionFireStore.collectionReferenceUsers.doc(uid!).get();
    final Map<String, dynamic> mapMe = list.data() as Map<String, dynamic>;
    return UserModel.fromJson(mapMe);
  }

  static dynamicX(String? uid) async {
    final list =
        await CollectionFireStore.collectionReferenceUsers.doc(uid!).get();
    final Map<String, dynamic> mapMe = list.data() as Map<String, dynamic>;
    return mapMe;
  }

  static Future<List<ChatModelView>> getownChat(String? uid) async {
    // The We will put th raw data inside
    List<dynamic> listOwn = [];
    await CollectionFireStore.collectionChat.get().then((value) {
      // For loop
      for (var element in value.docs) {
        final Map<String, dynamic> obj = element.data() as Map<String, dynamic>;
        // Since map is map add them to list
        listOwn.add(obj);
      }
    });
    // [ instance of chatmodel , instance of chatmodel ]
    // {
    //  "map" :"map"
    // }
    return listOwn.map((e) => ChatModelView.fromJson(e)).toList();
  }

  static Future<List<UserModel>> getUser() async {
    //
    List<dynamic> list = [];
    //
    await CollectionFireStore.collectionReferenceUsers.get().then((value) {
      for (var user in value.docs) {
        final Map<String, dynamic> obj = user.data() as Map<String, dynamic>;
        list.add(obj);
      }
    });

    return list.map((e) => UserModel.fromJson(e)).toList();
  }

  static Future<ChatModelView> getDetailChat(String? uidofUser) async {
    final mapData =
        await CollectionFireStore.collectionChat.doc(uidofUser!).get();
    //log(mapData.data().toString());
    final map = mapData.data() as Map<String, dynamic>;
    return ChatModelView.fromJson(map);
  }

  static Future<List<MessageViewModel>> getMessages(String? uid) async {
    //
    List<dynamic> list = [];
    //
    await CollectionFireStore.collectionChat
        .doc(uid!)
        .collection("messages")
        .get()
        .then((value) {
      for (var x in value.docs) {
        final Map<String, dynamic> obj = x.data();
        list.add(obj);
      }
    });

    return list.map((e) => MessageViewModel.fromJson(e)).toList();
  }
}

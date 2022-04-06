import 'dart:developer';

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

  static addTouserChatDummy() {
    // Map data
    final dataChat = {
      "participants":
          "QJwzy0O2BzMkjb4UPtjsg7y6hDD3,QJwzy0O2BzMkjb4UPtjsg7y6hDD3",
      "username": "Ali",
      "firstname": "",
      "lastname": "",
      "receiver": "QJwzy0O2BzMkjb4UPtjsg7y6hDD3",
      "type_room": "0",
    };
    // Map Message
    final dataFirstmessage = {
      "from": "QJwzy0O2BzMkjb4UPtjsg7y6hDD3",
      "timeStamp": DateTime.now().millisecondsSinceEpoch.toString(),
      "message": "helo",
      "images": [],
      "type": "",
      "dateTime": DateFormat("d MMM yyyy").add_jms().format(DateTime.now()),
      "to": "QJwzy0O2BzMkjb4UPtjsg7y6hDD3"
    };
    //Collection to create the chatroom
    final result = CollectionFireStore.collectionChat
        .doc("QJwzy0O2BzMkjb4UPtjsg7y6hDD3-QJwzy0O2BzMkjb4UPtjsg7y6hDD3");

    // Colection Runtraction
    firestore.runTransaction((transaction) async {
      transaction.set(result, dataChat);
    });

    CollectionFireStore.collectionChat
        .doc("QJwzy0O2BzMkjb4UPtjsg7y6hDD3-QJwzy0O2BzMkjb4UPtjsg7y6hDD3")
        .collection("messages")
        .add(dataFirstmessage);
  }

  static Future<UserModel> getUserData(String? uid) async {
    final list =
        await CollectionFireStore.collectionReferenceUsers.doc(uid!).get();
    final Map<String, dynamic> mapMe = list.data() as Map<String, dynamic>;
    return UserModel.fromJson(mapMe);
  }

  static getownChat(String? uid) async {
    final list = await CollectionFireStore.collectionChat.get().then((value) {
      // For loop
      for (var element in value.docs) {
        final List<dynamic> obj = [element.data() as Map<String, dynamic>];
        final List<dynamic> listOwn = obj
            .where((e) => e['participants'].toString().contains(uid!))
            .toList();
        return listOwn;
      }
    });
  }
}

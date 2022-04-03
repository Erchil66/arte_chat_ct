import 'package:chat/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CollectionFireStore {
  static final CollectionReference collectionReferenceUsers =
      Firebaseconstant.firestore.collection("users");
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
      "email": email!,
      "user_uid": uid!,
      "username": username ?? ""
    };
    final result =
        await CollectionFireStore.collectionReferenceUsers.doc(uid).set(data);
    return result;
  }

  static getUserData(String? uid) async {
    final list =
        await CollectionFireStore.collectionReferenceUsers.doc(uid!).get();
    final Map<String, dynamic> mapMe = list.data() as Map<String, dynamic>;
    return Users.fromJson(mapMe);
  }
}

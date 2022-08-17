

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealmashi/features/Screen/home/model/chat_model.dart';
import 'package:ealmashi/features/Screen/home/model/conversation_model.dart';

class ChatRepository {


//  User _userFromFirebaseUser(User user) {
//    return user != null ? User(uid: user.uid) : null;
//  }



  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  getUserInfo(String token) async {
    return FirebaseFirestore.instance.collection("users").where("token", isEqualTo: token).get().catchError((e) {
      print(e.toString());
    });
  }

  searchByName(String searchField) {
    return FirebaseFirestore.instance.collection("users").where('userName', isEqualTo: searchField).get();
  }

  // Create Conversation
  Future<void> createConversation(ConversationModel conversation) {
    return FirebaseFirestore.instance.collection("conversations").doc(conversation.id).set(conversation.toJson()).catchError((e) {
      print(e);
    });
  }

  Future<Stream<QuerySnapshot>> getUserConversations({required String userId}) async {
    return  FirebaseFirestore.instance
        .collection("conversations")
        .where('visible_to_users', arrayContains: userId)
    //.orderBy('time', descending: true)
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getChats(ConversationModel conversation) async {
    return updateConversation(conversation.id!, {'read_by_users': conversation.readByUsers}).then((value) async {
      return  FirebaseFirestore.instance
          .collection("conversations")
          .doc(conversation.id)
          .collection("chats")
          .orderBy('time', descending: true)
          .snapshots();
    });
  }

  Future<void> addMessage(ConversationModel conversation, ChatModel chat) {
    return FirebaseFirestore.instance.collection("conversations").doc(conversation.id).collection("chats").add(chat.toJson()).whenComplete(() {
      updateConversation(conversation.id!, conversation.toJson());
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> updateConversation(String conversationId, Map<String, dynamic> conversation) {
    return FirebaseFirestore.instance.collection("conversations").doc(conversationId).update(conversation).catchError((e) {
      print(e.toString());
    });
  }
}

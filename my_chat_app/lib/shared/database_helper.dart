import 'package:firebase_database/firebase_database.dart';
import 'package:my_chat_app/models/chatUserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  final FirebaseFirestore ff = FirebaseFirestore.instance;

  getUserByUsername(String username) async {
    return await ff
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  uploadUser(userMap) {
    ff.collection("users").add(userMap);
  }

//   final String uid;

//   final FirebaseDatabase db = FirebaseDatabase.instance.ref();

//   static Future addChat(ChatUsers chatUsers) async {
//     await db.child(chatUsers.userId).push().set(chatUsers.toMap()); //agregar
//   }

//   static void listenChats(String userId, Function updateData) {
//     db.child(userId).onValue.listen((event) {
//       Object? data = event.snapshot.value;
//       print(data);
//       updateData(data);
//     });
//   }
}

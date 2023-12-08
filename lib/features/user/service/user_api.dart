import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserRepository {
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    final userDataSnapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    return userDataSnapshot.data();
  }

  Future<String> getUserImage(String userId) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("user_images")
        .child("$userId.jpg");

    return await storageRef.getDownloadURL();
  }
}

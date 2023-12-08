import "package:cloud_firestore/cloud_firestore.dart";
import "package:dio/dio.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";

import "../../dog/dog_model/dog_model.dart";

const apiUrl = "http://192.168.1.103:3000";

class DogRepository {
  final dio = Dio(BaseOptions(
    baseUrl: apiUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));

  Future<List<DogModel>> getDogsList() async {
    final user = FirebaseAuth.instance.currentUser;
    List<DogModel> listDogModels = [];
    if (user != null) {
      final data = await FirebaseFirestore.instance.collection("dogs").get();
      for (int i = 0; i < data.docs.length; i++) {
        final dogMap = data.docs[i].data();
        final docId = data.docs[i].id;
        dogMap["id"] = docId;
        print(docId);
        listDogModels.add(DogModel.fromMap(dogMap));
      }
    }

    return listDogModels;
  }

  Future<void> createDog(DogModel dog) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final data = await FirebaseFirestore.instance
            .collection("dogs")
            .add(dog.toMap(user.uid));
        print(data);
      } else {
        throw Exception("Failed to create dog");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteDog(String id) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        FirebaseFirestore.instance.collection("dogs").doc(id).delete().then(
              (doc) => print("Document deleted"),
              onError: (error) => print(error),
            );
      } else {
        throw Exception("Failed to delete dog");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> editDog(DogModel dog) async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        final data = FirebaseFirestore.instance
            .collection("dogs")
            .doc(dog.id)
            .update(dog.toMap(user.uid));
        print(data);
      } else {
        throw Exception("Failed to update dog");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> getDogsImage(String dogId) async {
    final storageRef =
        FirebaseStorage.instance.ref().child("dogs_images").child("$dogId.jpg");

    return await storageRef.getDownloadURL();
  }
}

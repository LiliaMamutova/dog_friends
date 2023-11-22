import "dart:convert";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:dio/dio.dart";
import "package:firebase_auth/firebase_auth.dart";

import "../../dog/dog_model/dog_model.dart";

const apiUrl = "http://192.168.1.103:3000";

class DogApi {
  final dio = Dio(BaseOptions(
    baseUrl: apiUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));

  Future<List<DogModel>> getDogsList() async {
    final response = await dio.get("/dogs");
    final List<DogModel> dogsList = [];

    for (int i = 0; i < response.data.length; i++) {
      final dogMap = response.data[i];
      final dog = DogModel.fromMap(dogMap);
      dogsList.add(dog);
    }

    return dogsList;
  }

  Future<DogModel> getDog(String id) async {
    final Response response = await dio.get(
      "/dogs",
      queryParameters: {"id": id.toString()},
    );
    print(response);
    final dogMap = jsonDecode(response.data);
    final DogModel dog = DogModel.fromMap(dogMap);

    return dog;
  }

  Future<void> createDog(DogModel dog) async {
    // final Response response =
    //     await dio.post("/dogs", data: {"dog": dog.toString()});
    // print(response.data);
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final data = FirebaseFirestore.instance
            .collection("dogs")
            .add(dog.toMap(user.uid));
        print(data);
      } else {
        throw Exception("Fuck");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteDog(String id) async {
    print(dio.options.baseUrl);

    final Response response = await dio.delete("/dogs/${id.toString()}");
    print(response);
  }

  Future<void> editDog(DogModel dog) async {
    print(dio.options.baseUrl);
    final Response response = await dio.put(
      "/dogs/${dog.id.toString()}",
      data: dog,
    );
    print(response.data);
  }
}

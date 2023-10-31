import "dart:convert";

import "package:http/http.dart" as http;

import "../../dog/dog_model/dog_model.dart";

const apiUrl = "http://192.168.1.103:3000";

class DogApi {
  Future<List<DogModel>> getDogsList() async {
    Uri url = Uri.parse("$apiUrl/dogs");
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    final List<DogModel> dogsList = [];

    for (int i = 0; i < data.length; i++) {
      final dogMap = data[i];
      final dog = DogModel.fromMap(dogMap);
      dogsList.add(dog);
    }

    return dogsList;
  }

  Future<DogModel> getDog(int id) async {
    Uri url = Uri.parse("$apiUrl/dogs/:${id.toString()}");
    final response = await http.get(url);
    final dogMap = jsonDecode(response.body);
    final DogModel dog = DogModel.fromMap(dogMap);

    return dog;
  }

  Future<void> createDog(DogModel dog) async {
    Uri url = Uri.parse("$apiUrl/dogs");
    final response = await http.post(url, body: dog.toString());
    print(response.body);
  }

  Future<void> deleteDog(int id) async {
    Uri url = Uri.parse("$apiUrl/dogs/:${id.toString()}");
    final response = await http.delete(url);
    final data = jsonDecode(response.body);
    print(data);
  }

  Future<void> editDog(DogModel dog) async {
    print(dog.id);
    Uri url = Uri.parse("$apiUrl/dogs/:${dog.id.toString()}");
    final response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: dog.toString(),
    );
    final data = jsonDecode(response.body);
  }
}

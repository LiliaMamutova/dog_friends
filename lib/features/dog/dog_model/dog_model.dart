import 'dart:convert';

const mockImageUrl =
    "https://www.akc.org/wp-content/uploads/2017/11/Pembroke-Welsh-Corgi-standing-outdoors-in-the-fall.jpg";

class DogModel {
  String userId = "";
  String id;
  String image = "";
  String name = "";
  String breed = "";
  String gender = "";
  String birthDate = "";
  String dogFeatures = "";

  DogModel({
    this.image = "",
    this.name = "",
    this.breed = "",
    this.gender = "",
    this.birthDate = "",
    this.dogFeatures = "",
    this.id = "0",
    this.userId = "",
  });

  factory DogModel.fromMap(Map<String, dynamic> mapDog) {
    final dog = DogModel(
      id: mapDog["id"],
      image: mapDog["image"] ?? mockImageUrl,
      name: mapDog["name"]!,
      breed: mapDog["breed"]!,
      gender: mapDog["gender"]!,
      birthDate: mapDog["birthDate"]!,
      dogFeatures: mapDog["dogFeatures"]!,
    );

    return dog;
  }

  @override
  String toString() {
    Map<String, dynamic> mapDog = {
      "image": image,
      "name": name,
      "breed": breed,
      "gender": gender,
      "birthDate": birthDate,
      "dogFeatures": dogFeatures,
    };

    return jsonEncode(mapDog);
  }
}

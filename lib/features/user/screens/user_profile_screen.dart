import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_friends/shared_helpers/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared_errors/error_message_required.dart';
import '../../auth/models/user.model.dart';
import '../user_provider/user_provider.dart';

// final _firebase = FirebaseAuth.instance;

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  String imageUrl = "";
  String userName = "";
  final _formKey = GlobalKey<FormState>();
  UserCredential? userCredentials;

  // bool isLogIn = true;
  // bool isSignUp = true;
  final UserAuthData _user = UserAuthData();
  File? _selectedImage;
  Map<String, dynamic>? data = null;

  @override
  void initState() {
    super.initState();
    userCredentials =
        ref.read(userNotifierProvider.notifier).getUserCredential();
    print("user profile screen: $userCredentials");
    FirebaseDatabase.instance.ref().child("user");
    getAvatar();
    getData();
  }

  void getAvatar() async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("user_images")
        .child("${userCredentials!.user!.uid}.jpg");

    imageUrl = await storageRef.getDownloadURL();

    setState(() {
      imageUrl = imageUrl;
    });
    // print(imageUrl);
  }

  void getData() async {
    print(FirebaseAuth.instance.currentUser?.uid);
    final dataUser = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    data = dataUser.data();

    if (data == null) {
      return;
    }

    setState(() {
      _user.userName = data!["userName"];
      _user.amountOfDogs = data!["amountOfDogs"];
      _user.country = data!["country"];
      _user.city = data!["city"];
      _user.phoneNumber = data!["phoneNumber"];
    });
  }

  void _saveUserName(String? value) {
    _user.userName = value!;
  }

  void _saveUserAmountOfDogs(String? value) {
    _user.amountOfDogs = value!;
  }

  void _saveUserCountry(String? value) {
    _user.country = value!;
  }

  void _saveUserCity(String? value) {
    _user.city = value!;
  }

  String? _validate(String? value, {Function(String? value)? callBack}) {
    if (value == null || value.isEmpty) {
      return errorMessageRequired;
    }

    if (callBack != null) {
      return callBack(value);
    }

    return null;
  }

  void _onSave() async {
    final isFormValid = _formKey.currentState?.validate();

    if (isFormValid != null && isFormValid && _selectedImage != null) {
      print(_selectedImage);
      final storageRef = FirebaseStorage.instance
          .ref()
          .child("user_images")
          .child("${userCredentials!.user!.uid}.jpg");

      await storageRef.putFile(_selectedImage!);
      imageUrl = await storageRef.getDownloadURL();
    }
    _formKey.currentState!.save();

    if (userCredentials == null || userCredentials!.user == null) {
      print("user creds not available");
      return;
    }

    // saving photo end

    final currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser);

    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set({
      "userName": _user.userName,
      "amountOfDogs": _user.amountOfDogs,
      "country": _user.country,
      "city": _user.city,
      "phoneNumber": _user.phoneNumber,
      "userId": FirebaseAuth.instance.currentUser?.uid,
    });

    await FirebaseFirestore.instance
        .collection("user")
        .doc(currentUser?.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    // final userCredential = ref.watch(userNotifierProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          PhotoPicker(
            onPickImage: (pickedImage) {
              _selectedImage = pickedImage;
            },
            imageUrl: imageUrl,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Form(
              key: _formKey,
              child: data == null
                  ? Text("Loading")
                  : Column(
                      children: [
                        SizedBox(height: 10),
                        TextFormField(
                          key: _user.userName == null
                              ? Key("userName")
                              : Key(_user.userName!),
                          initialValue: data?["userName"] ?? "no value",
                          onSaved: _saveUserName,
                          validator: _validate,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Harry Potter",
                            labelText: "Enter your name",
                            filled: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          key: _user.amountOfDogs == null
                              ? Key("amountOfDogs")
                              : Key(_user.amountOfDogs!),
                          initialValue: data?["amountOfDogs"] ?? "no value",
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.number,
                          onSaved: _saveUserAmountOfDogs,
                          validator: _validate,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "How many dogs do you have?",
                            labelText: "Enter number of dog",
                            filled: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          key: _user.country == null
                              ? Key("country")
                              : Key(_user.country!),
                          initialValue: data?["country"] ?? "no value",
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.text,
                          onSaved: _saveUserCountry,
                          validator: _validate,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Ukraine",
                            labelText: "Enter your country",
                            filled: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          key: _user.city == null
                              ? Key("city")
                              : Key(_user.city!),
                          initialValue: data?["city"] ?? "no value",
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.text,
                          onSaved: _saveUserCity,
                          validator: _validate,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Kyiv",
                            labelText: "Enter your city",
                            filled: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/tokyo1.jpeg"),
                                radius: 40,
                              ),
                            ),
                            TextButton(
                              child: Text(strings.userProfileScreenDogName1),
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 900,
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/javelina.jpeg"),
                                radius: 40,
                              ),
                            ),
                            TextButton(
                              child: Text(strings.userProfileScreenDogName2),
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 900,
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _onSave,
                          child: Text(strings.userProfileScreenSaveButton),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

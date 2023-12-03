import 'dart:io';

import 'package:dog_friends/features/user/user_provider/user_provider.dart';
import 'package:dog_friends/shared_helpers/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared_errors/error_message_required.dart';
import '../../../shared_widgets/nav_bar_widget.dart';
import '../../auth/models/user.model.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  String imageUrl = "";
  final _formKey = GlobalKey<FormState>();
  UserCredential? userCredentials;
  bool isLogIn = true;
  final UserAuthData _user = UserAuthData();
  File? _selectedImage;

  @override
  void initState() {
    userCredentials =
        ref.read(userNotifierProvider.notifier).getUserCredential();
    print("user profile screen:  $userCredentials");
    getAvatar();
    super.initState();
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
    print(imageUrl);
  }

  void _saveUserName(String? value) {
    _user.userName = value!;
  }

  void _saveUserNumberOfDogs(String? value) {
    _user.numberOfDog = value!;
  }

  void _saveUserCountry(String? value) {
    _user.numberOfDog = value!;
  }

  void _saveUserCity(String? value) {
    _user.numberOfDog = value!;
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

    if (isFormValid != null && isFormValid && _selectedImage == null) {
      return;
    }
    _formKey.currentState!.save();

    if (userCredentials == null || userCredentials!.user == null) {
      print("user creds not available");
      return;
    }

    final storageRef = FirebaseStorage.instance
        .ref()
        .child("user_images")
        .child("${userCredentials!.user!.uid}.jpg");

    await storageRef.putFile(_selectedImage!);
    imageUrl = await storageRef.getDownloadURL();
    // print(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () {}, //=> context.push("/setting"),
          child: const Icon(
            Icons.settings,
            size: 30,
          ),
        ),
      ]),
      body: SingleChildScrollView(
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
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    TextFormField(
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.name,
                      onSaved: _saveUserName,
                      validator: _validate,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Harry Potter",
                        labelText: "Enter your name",
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.name,
                      onSaved: _saveUserNumberOfDogs,
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
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.name,
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
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.name,
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
                          child: Text("Tokyo"),
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
                          child: Text("Javick"),
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
                      child: Text("Save"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

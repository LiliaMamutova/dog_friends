import 'package:dog_friends/shared_errors/error_message_required.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/patterns.dart';
import '../models/user.model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  late final UserAuthData _user = UserAuthData();

  bool isPasswordVisible = false;

  void _changePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void goToUserProfile(BuildContext context) {
    //todo: implement navigation to user profile;
  }

  void _submitForm() {
    final isFormValid = _formKey.currentState?.validate();

    if (isFormValid != null && isFormValid) {
      _formKey.currentState!.save();
      goToUserProfile(context);
    }
  }

  void _saveUserName(String? value) {
    _user.userName = value!;
  }

  void _saveUserPhoneNumber(String? value) {
    _user.phoneNumber = value!;
  }

  void _saveUserEmail(String? value) {
    _user.email = value!;
  }

  void _saveUserPassword(String? value) {
    _user.password = value!;
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

  String? _checkEmail(String? value) {
    final isEmailValid = emailPattern.hasMatch(value!);
    if (!isEmailValid) {
      return "This email not valid";
    }
    return null;
  }

  String? _checkPasswordsLength(String? value) {
    if (value != null && value.length < 6) {
      return "Password's length should be non less 6 symbol";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.03,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 80),
                      TextFormField(
                        onSaved: _saveUserName,
                        validator: _validate,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Harry Potter",
                          labelText: "Enter your name",
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        onSaved: _saveUserPhoneNumber,
                        validator: _validate,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Phone number",
                          labelText: "Enter phone number",
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        onSaved: _saveUserEmail,
                        validator: (String? value) => _validate(
                          value,
                          callBack: _checkEmail,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "example@mail.com",
                          labelText: "Enter your email",
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        onSaved: _saveUserPassword,
                        validator: (String? value) => _validate(
                          value,
                          callBack: _checkPasswordsLength,
                        ),
                        obscureText: isPasswordVisible,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "******",
                          labelText: "Password",
                          filled: true,
                          prefixIcon: const Icon(Icons.search),
                          suffix: IconButton(
                            icon: const Icon(Icons.remove_red_eye_outlined),
                            onPressed: _changePasswordVisibility,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "LilitaOneScript",
                          // Theme.of(context).textButtonTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

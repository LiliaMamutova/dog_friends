import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../user.model.dart';

final emailValidator = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static const errorMessageRequired = "This field is required";
  final _formKey = GlobalKey<FormState>();

  late final User _user = User();

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

  String? _isNullOrEmpty(String? value, {Function(String? value)? callBack}) {
    if (value == null || value.isEmpty) {
      return errorMessageRequired;
    }

    if (callBack != null) {
      return callBack(value);
    }

    return null;
  }

  String? _checkEmail(String? value) {
    final isEmailValid = emailValidator.hasMatch(value!);
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
                        validator: _isNullOrEmpty,
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
                        validator: _isNullOrEmpty,
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
                        validator: (String? value) => _isNullOrEmpty(
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
                        validator: (String? value) => _isNullOrEmpty(
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
                  // const Spacer(),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text("Submit"),
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

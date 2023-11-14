import 'package:dog_friends/features/user/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared_errors/error_message_required.dart';
import '../helpers/patterns.dart';
import '../models/user.model.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  bool isLogIn = true;
  final _formKey = GlobalKey<FormState>();

  late final User _user = User();

  bool isPasswordVisible = false;

  void _changePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void goToUserProfile(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const UserProfileScreen()));
  }

  void _submitForm() {
    final isFormValid = _formKey.currentState?.validate();

    if (isFormValid != null && isFormValid) {
      _formKey.currentState!.save();
      goToUserProfile(context);
    }
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

  void _setAuthProcedure() {
    setState(() {
      isLogIn = !isLogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.03,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!isLogIn)
                      Text(
                        "Please sign up",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 5.0,
                            ),
                      ),
                    Column(
                      children: [
                        const SizedBox(height: 40),
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
                        const SizedBox(height: 10),
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
                            suffix: IconButton(
                              icon: const Icon(Icons.remove_red_eye_outlined),
                              onPressed: _changePasswordVisibility,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (!isLogIn)
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
                              labelText: "Enter password again",
                              filled: true,
                              suffix: IconButton(
                                icon: const Icon(Icons.remove_red_eye_outlined),
                                onPressed: _changePasswordVisibility,
                              ),
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 3.0,
                                height: 65,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: _submitForm,
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: "LilitaOneScript",
                                        //  style: Theme.of(context).textTheme.titleMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.0,
                              height: 65,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  onPressed: _setAuthProcedure,
                                  child: Text(
                                    isLogIn ? "Log in" : "Sign up",
                                    // style: const TextStyle(
                                    //   fontSize: 25,
                                    //   fontFamily: "LilitaOneScript",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                            ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

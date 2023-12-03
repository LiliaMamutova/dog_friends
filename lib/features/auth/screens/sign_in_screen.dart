import 'package:dog_friends/features/user/screens/user_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared_errors/error_message_required.dart';
import '../../user/user_provider/user_provider.dart';
import '../helpers/patterns.dart';
import '../models/user.model.dart';

final _firebase = FirebaseAuth.instance;

final class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  String _password = "";
  bool isLogIn = true;
  final _formKey = GlobalKey<FormState>();

  final UserAuthData _user = UserAuthData();

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

  void _onSubmit() async {
    final isFormValid = _formKey.currentState?.validate();
    if (isFormValid != null && isFormValid) {
      _formKey.currentState!.save();
    }
    if (_user.email == null || _user.password == null) {
      showScaffoldMessage("Empty credentials");
      return;
    }

    if (_user.email!.isEmpty || _user.password!.isEmpty) {
      showScaffoldMessage("Empty credentials");
      return;
    }
    if (isLogIn) {
      await loginUser();
    } else {
      await signupUser();
    }
  }

  Future<void> signupUser() async {
    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
        email: _user.email!,
        password: _user.password!,
      );
      goToUserProfile(context);
      print("signup: $userCredentials");
    } on FirebaseAuthException catch (error) {
      showScaffoldMessage(error.message ?? "Authentication error");
    }
  }

  Future<void> loginUser() async {
    try {
      final userCredentials = await _firebase.signInWithEmailAndPassword(
        email: _user.email!,
        password: _user.password!,
      );
      print("login: $userCredentials");
      ref
          .read(userNotifierProvider.notifier)
          .setUserCredential(userCredentials);
      goToUserProfile(context);
    } on FirebaseAuthException catch (error) {
      showScaffoldMessage(error.message ?? "Authentication error");
    }
  }

  void showScaffoldMessage(String error) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
      ),
    );
  }

  void _saveUserEmail(String? value) {
    _user.email = value!;
  }

  void _saveUserPassword(String? value) {
    _user.password = value!;
  }

  String? _validate(String? value, {Function(String? value)? callBack}) {
    if (value == null || value.trim().isEmpty) {
      return errorMessageRequired;
    } else if (callBack != null) {
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

  String? _checkPasswordAreEqual(String? repeatedPassword) {
    if (repeatedPassword != null && _password != repeatedPassword) {
      return "Password does not match. Please re-type again";
    }
    return null;
  }

  void _onPasswordChanged(String value) {
    _password = value;
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
                    Text(
                      isLogIn
                          ? "I already have an account"
                          : "Please create an account",
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
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "example@mail.com",
                            labelText: "Enter your email",
                            filled: true,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: _saveUserPassword,
                          onChanged: _onPasswordChanged,
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
                            keyboardType: TextInputType.text,
                            onSaved: null,
                            validator: (String? value) => _validate(
                              value,
                              callBack: _checkPasswordAreEqual,
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
                                    onPressed: _onSubmit,
                                    child: const Text(
                                      "Submit",
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
                                    isLogIn ? "Sign up" : "Log in",
                                  ),
                                ),
                              ),
                            ),
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

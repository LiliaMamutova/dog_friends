import 'dart:io';

import 'package:dog_friends/features/user/user_provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared_errors/error_message_required.dart';
import '../../../shared_provider/localization_notifier.dart';
import '../../../shared_provider/theme_mode_notifier.dart';
import '../../auth/helpers/patterns.dart';
import '../../auth/models/user.model.dart';

final _firebase = FirebaseAuth.instance;

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  final _formKey = GlobalKey<FormState>();
  final UserAuthData _user = UserAuthData();
  UserCredential? userCredentials;

  // String userName = "";
  String imageUrl = "";
  File? _selectedImage;

  void _changeThemeMode() {
    ref.read(themeNotifierProvider.notifier).changeThemeMode();
  }

  void _changeLocale() {
    ref.read(localizationNotifierProvider.notifier).changeLocale();
  }

  void _saveUserPhoneNumber(String? value) {
    _user.phoneNumber = value!;
  }

  void _saveUserEmail(String? value) {
    _user.email = value!;
  }

  void _saveUserName(String? value) {
    _user.userName = value!;
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
  }

  @override
  Widget build(BuildContext context) {
    final ThemeMode mode = ref.watch(themeNotifierProvider);
    final userCredential = ref.watch(userNotifierProvider);
    final strings = AppLocalizations.of(context)!;

    print(userCredential?.user?.email);
    print(userCredential?.user?.displayName);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
            floating: false,
            pinned: true,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                AppLocalizations.of(context)!.dogFriends,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Form(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(strings.settingScreenChangeTheme),
                            ),
                            SizedBox(width: 40),
                            IconButton(
                              onPressed: _changeThemeMode,
                              icon: Icon(
                                mode == ThemeMode.dark
                                    ? Icons.dark_mode
                                    : Icons.sunny,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(strings.settingScreenChangeLocale),
                            ),
                            SizedBox(width: 40),
                            IconButton(
                              onPressed: _changeLocale,
                              icon: Icon(
                                Icons.language,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        initialValue: userCredential?.user?.phoneNumber,
                        onSaved: _saveUserPhoneNumber,
                        validator: _validate,
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.characters,
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
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue: userCredential?.user?.email ?? "no email",
                        onSaved: _saveUserEmail,
                        validator: (String? value) => _validate(
                          value,
                          callBack: _checkEmail,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "example@mail.com",
                          labelText: "Enter your email",
                          filled: true,
                        ),
                      ),
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
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _onSave,
                        child: Text(strings.settingScreenSaveButton),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      ),
      // bottomNavigationBar: const NavBar(),
    );
  }
}

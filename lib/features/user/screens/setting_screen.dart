import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared_errors/error_message_required.dart';
import '../../../shared_provider/localization_notifier.dart';
import '../../../shared_provider/theme_mode_notifier.dart';
import '../../../shared_widgets/nav_bar_widget.dart';
import '../../auth/models/user.model.dart';

final _firebase = FirebaseAuth.instance;

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  final UserAuthData _user = UserAuthData();

  void _changeThemeMode() {
    ref.read(themeNotifierProvider.notifier).changeThemeMode();
  }

  void _changeLocale() {
    ref.read(localizationNotifierProvider.notifier).changeLocale();
  }

  void _saveUserPhoneNumber(String? value) {
    _user.phoneNumber = value!;
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

  @override
  Widget build(BuildContext context) {
    final ThemeMode mode = ref.watch(themeNotifierProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
            floating: false,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () => context.go("/setting"),
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ),
              ),
            ],
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
                              child: Text("Change theme"),
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
                              child: Text("Change locale"),
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
                        // onTap: () =>
                        //     FocusManager.instance.primaryFocus?.unfocus(),
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
      bottomNavigationBar: const NavBar(),
    );
  }
}

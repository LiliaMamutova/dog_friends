import 'package:dog_friends/features/user/screens/user_profile_screen.dart';
import 'package:dog_friends/theme_data/dark_theme/dark_theme.dart';
import 'package:dog_friends/theme_data/light_theme/light_theme.dart';
import 'package:dog_friends/value_notifier/theme_mode_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

const uk = Locale("uk");
const en = Locale("en");

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = uk;

  void setLocale() {
    setState(() {
      _locale = _locale == uk ? en : uk;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'Dog Friends',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale,
          localeListResolutionCallback: (
            locale,
            supportedLocales,
          ) {
            return locale?.last;
          },
          home: UserProfileScreen(changeLang: setLocale),
        );
      },
    );
  }
}

import 'package:dog_friends/firebase_options.dart';
import 'package:dog_friends/shared_provider/localization_notifier.dart';
import 'package:dog_friends/shared_provider/theme_mode_notifier.dart';
import 'package:dog_friends/shared_router/go_router_navigation.dart';
import 'package:dog_friends/theme_data/dark_theme/dark_theme.dart';
import 'package:dog_friends/theme_data/light_theme/light_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));

  await Firebase.initializeApp(
    name: "dog-friends-2023",
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final ThemeMode mode = ref.watch(themeNotifierProvider);
    final Locale locale = ref.watch(localizationNotifierProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Dog Friends',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      darkTheme: lightTheme,
      themeMode: mode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      localeListResolutionCallback: (locale, supportedLocales) {
        return locale?.last;
      },
    );
  }
}

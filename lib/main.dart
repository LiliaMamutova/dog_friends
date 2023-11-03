import 'package:dog_friends/features/user/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/user/bloc/theme_mode_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeModeCubit())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeModeCubit theme =
        BlocProvider.of<ThemeModeCubit>(context, listen: true);

    // final ThemeMode mode = ref.watch(themeNotifierProvider);
    // final Locale locale = ref.watch(localizationNotifierProvider);

    return MaterialApp(
      title: 'Dog Friends',
      debugShowCheckedModeBanner: false,
      theme: theme.isDark ? ThemeData.dark() : ThemeData.light(),

      // theme: lightTheme,
      // darkTheme: darkTheme,
      // themeMode: mode,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      // locale: locale,
      // localeListResolutionCallback: (locale, supportedLocales) {
      //   return locale?.last;
      // },
      home: const UserProfileScreen(),
    );
  }
}

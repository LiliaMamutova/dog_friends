import 'package:dog_friends/features/auth/screens/welcome_screen.dart';
import 'package:dog_friends/features/dog/screen/dogs_list_feature.dart';
import 'package:dog_friends/features/user/screens/chat_screen.dart';
import 'package:dog_friends/features/user/screens/setting_screen.dart';
import 'package:dog_friends/features/user/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/screens/auth_screen.dart';
import '../features/auth/screens/sign_in_screen.dart';
import '../features/auth/screens/sign_up_screen.dart';
import '../features/dog/screen/dog_profile_screen.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) =>
          const WelcomeScreen(),
    ),
    GoRoute(
      path: "/auth",
      builder: (BuildContext context, GoRouterState state) =>
          const AuthScreen(),
    ),
    GoRoute(
      path: "/signUp",
      builder: (BuildContext context, GoRouterState state) =>
          const SignUpScreen(),
    ),
    GoRoute(
      path: "/signIn",
      builder: (BuildContext context, GoRouterState state) =>
          const SignInScreen(),
    ),
    GoRoute(
      path: "/dogsList",
      builder: (BuildContext context, GoRouterState state) =>
          const DogsListScreen(),
    ),
    GoRoute(
      path: "/dogProfile",
      builder: (BuildContext context, GoRouterState state) =>
          const DogProfileScreen(),
    ),
    GoRoute(
      path: "/setting",
      builder: (BuildContext context, GoRouterState state) =>
          const SettingScreen(),
    ),
    GoRoute(
      path: "/message",
      builder: (BuildContext context, GoRouterState state) =>
          const ChatScreen(),
    ),
    GoRoute(
      path: "/userProfile",
      builder: (BuildContext context, GoRouterState state) =>
          const UserProfileScreen(),
    ),
    // GoRoute(
    //   path: "/setting",
    //   builder: (BuildContext context, GoRouterState state) =>
    // const SettingScreen(),
    // ),
  ],
);

GoRouter get router => _router;

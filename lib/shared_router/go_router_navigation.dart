import 'package:dog_friends/features/auth/screens/welcome_screen.dart';
import 'package:dog_friends/features/user/screens/main_screen.dart';
import 'package:dog_friends/features/user/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/screens/auth_screen.dart';
import '../features/auth/screens/sign_in_screen.dart';
import '../features/dog/screen/dog_profile_screen.dart';
import '../features/user/screens/user_profile_screen.dart';

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
      path: "/signIn",
      builder: (BuildContext context, GoRouterState state) =>
          const SignInScreen(),
    ),
    GoRoute(
      path: "/userProfile",
      builder: (BuildContext context, GoRouterState state) =>
          const UserProfileScreen(),
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
      path: "/mainScreen",
      builder: (BuildContext context, GoRouterState state) =>
          const MainScreen(),
    ),
  ],
);

GoRouter get router => _router;

import 'package:dog_friends/features/auth/screens/welcome_screen.dart';
import 'package:dog_friends/features/dog/screen/dogs_list_feature.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/screens/auth_screen.dart';
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
      path: "/dogsList",
      builder: (BuildContext context, GoRouterState state) =>
          const DogsListScreen(),
    ),
    GoRoute(
      path: "/dogProfile",
      builder: (BuildContext context, GoRouterState state) =>
          const DogProfileScreen(),
    ),
  ],
);

GoRouter get router => _router;

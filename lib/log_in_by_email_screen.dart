import 'package:dog_friends/user_profile_screen.dart';
import 'package:flutter/material.dart';

class LogInByEmailScreen extends StatelessWidget {
  const LogInByEmailScreen({super.key});

  void goToUserProfile(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const UserProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

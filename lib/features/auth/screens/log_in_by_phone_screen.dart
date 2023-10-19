import 'package:flutter/material.dart';

import '../../user/screens/user_profile_screen.dart';

class LogInByPhoneScreen extends StatelessWidget {
  const LogInByPhoneScreen({super.key});

  void goToUserProfile(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const UserProfileScreen(
              changeLang: null,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

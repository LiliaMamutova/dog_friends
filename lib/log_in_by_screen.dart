import 'package:dog_friends/log_in_by_email_screen.dart';
import 'package:dog_friends/log_in_by_phone_screen.dart';
import 'package:flutter/material.dart';

class LogInByScreen extends StatelessWidget {
  const LogInByScreen({super.key});

  void goToLogInByPhone(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LogInByPhoneScreen()));
  }

  void goToLogInByEmail(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LogInByEmailScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

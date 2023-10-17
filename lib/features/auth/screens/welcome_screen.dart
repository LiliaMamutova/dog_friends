import 'package:flutter/material.dart';

import 'auth_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  void goTo(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/dog_close_without_background.png",
              height: 300,
              width: 280,
            ),
            Text(
              "Dog friends",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: const Color(0xffc7c0c8)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
              child: ElevatedButton(
                onPressed: () => goTo(context),
                child: const Text(
                  "Start",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "LilitaOneScript",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

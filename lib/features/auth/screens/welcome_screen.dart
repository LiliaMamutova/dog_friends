import 'package:dog_friends/theme_data/dark_theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: 50,
              child: ElevatedButton(
                onPressed: () => context.push("/auth"),
                child: Text(
                  "Start",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: darkBlue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

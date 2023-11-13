import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                child: const Text(
                  "Start",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "LilitaOneScript",
                    // Theme.of(context).textButtonTheme.titleSmall,
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

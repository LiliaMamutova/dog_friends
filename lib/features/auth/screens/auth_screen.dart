import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../mock_data/helpers.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({Key? key}) : super(key: key);

  List<InlineSpan> _createTextIconsListWidgets() {
    final List<InlineSpan> textIconsListWidgets = [];

    for (int i = 0; i < goalOfApp.length; i++) {
      var item = goalOfApp[i];

      final List<InlineSpan> itemWidgets = [
        WidgetSpan(
          child: item.icon,
        ),
        TextSpan(
          text: item.text,
        )
      ];
      textIconsListWidgets.addAll(itemWidgets);
    }

    return textIconsListWidgets;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textIconsListWidgets = _createTextIconsListWidgets();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox(
              height: 400,
              width: 350,
              child: RichText(
                // selectionColor: Colors.white,
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.6,
                      ),
                  children: [
                    TextSpan(
                      text:
                          "This app is especially suitable for people who: \n",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    // ),
                    ...textIconsListWidgets,
                  ],
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => context.push("/signIn"),
                  child: const Text(
                    "Proceed",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

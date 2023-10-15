import 'package:flutter/material.dart';

import '../mock_data/helpers.dart';
import 'sign_up_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  void goToSignUp(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

  void goToSignIn(BuildContext context) {
    //todo: implement navigation to signInScreen
  }

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
  Widget build(BuildContext context) {
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
                selectionColor: Colors.white,
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    height: 1.6,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          "This app is especially suitable for people who: \n",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: "LilitaOneScript",
                      ),
                    ),
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
                  onPressed: () => goToSignIn(context),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "LilitaOneScript",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => goToSignUp(context),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "LilitaOneScript",
                    ),
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

import 'package:dog_friends/log_in_by_screen.dart';
import 'package:dog_friends/sign_up_data_screen.dart';
import 'package:flutter/material.dart';

class SignUpAndSignInScreen extends StatelessWidget {
  final List<ListOfIconsAndTexts> goalOfApp = [
    ListOfIconsAndTexts(const Icon(Icons.pets),
        " recently got a dog and are looking for friends for walks;\n"),
    ListOfIconsAndTexts(const Icon(Icons.pets),
        " have moved to another city and do not know anyone; \n"),
    ListOfIconsAndTexts(const Icon(Icons.pets),
        " have certain characteristics in their dog that cannot walk with any dog; \n"),
    ListOfIconsAndTexts(const Icon(Icons.pets),
        " are looking for dogs for mating of certain breeds; \n"),
    ListOfIconsAndTexts(
        const Icon(Icons.pets), " seek socialization of dogs and people. \n"),
  ];

  SignUpAndSignInScreen({Key? key}) : super(key: key);

  void goToSignUp(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SignUpDataScreen()));
  }

  void goToSignIn(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LogInByScreen()));
  }

  @override
  Widget build(BuildContext context) {
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
                width: (MediaQuery.of(context).size.width / 3),
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
                width: (MediaQuery.of(context).size.width / 3),
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

class ListOfIconsAndTexts {
  final Icon icon;
  final String text;

  ListOfIconsAndTexts(this.icon, this.text);
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int bottomSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(bottomSelectedIndex);
    final strings = AppLocalizations.of(context)!;

    return BottomNavigationBar(
      currentIndex: bottomSelectedIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.message,
            size: 29,
          ),
          label: strings.bottomNavigationBarIconMessage,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.pets,
            size: 29,
          ),
          label: strings.bottomNavigationBarIconListOfDogs,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.other_houses,
            size: 29,
          ),
          label: strings.bottomNavigationBarIconUserProfile,
        ),
      ],
    );
  }
}

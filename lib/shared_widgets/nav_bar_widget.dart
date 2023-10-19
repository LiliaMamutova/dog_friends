import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    return BottomNavigationBar(
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
          label: strings.bottomNavigationBarIconDogProfile,
        ),
      ],
    );
  }


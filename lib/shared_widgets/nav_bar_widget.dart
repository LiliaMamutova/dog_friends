import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.message,
            size: 29,
          ),
          label: AppLocalizations.of(context)!.bottomNavigationBarIconMessage,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.pets,
            size: 29,
          ),
          label:
              AppLocalizations.of(context)!.bottomNavigationBarIconListOfDogs,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.search,
            size: 29,
          ),
          label:
              AppLocalizations.of(context)!.bottomNavigationBarIconSearchOfDog,
        ),
      ],
    );
  }
}

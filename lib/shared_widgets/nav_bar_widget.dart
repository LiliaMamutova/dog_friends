import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavBar extends ConsumerWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context)!;

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: TextButton(
            onPressed: () => context.go("/message"),
            child: const Icon(
              Icons.message,
              size: 29,
            ),
          ),
          label: strings.bottomNavigationBarIconMessage,
        ),
        BottomNavigationBarItem(
          icon: TextButton(
            onPressed: () => context.go("/dogsList"),
            child: const Icon(
              Icons.pets,
              size: 29,
            ),
          ),
          label: strings.bottomNavigationBarIconListOfDogs,
        ),
        BottomNavigationBarItem(
          icon: TextButton(
            onPressed: () => context.go("/userProfile"),
            child: const Icon(
              Icons.other_houses,
              size: 29,
            ),
          ),
          label: strings.bottomNavigationBarIconUserProfile,
        ),
      ],
    );
  }
}

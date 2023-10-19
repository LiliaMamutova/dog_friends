import 'package:dog_friends/shared_widgets/nav_bar_widget.dart';
import 'package:dog_friends/value_notifier/theme_mode_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserProfileScreen extends StatelessWidget {
  final void Function()? changeLang;

  const UserProfileScreen({super.key, required this.changeLang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
            floating: false,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  themeModeNotifier.value =
                      themeModeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                },
                icon: const Icon(
                  Icons.pets,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: changeLang,
                icon: const Icon(Icons.language),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                AppLocalizations.of(context)!.dogFriends,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

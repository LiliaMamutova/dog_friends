import 'package:dog_friends/shared_provider/localization_notifier.dart';
import 'package:dog_friends/shared_provider/theme_mode_notifier.dart';
import 'package:dog_friends/shared_widgets/nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  void _changeThemeMode(WidgetRef ref) {
    ref.read(themeNotifierProvider.notifier).changeThemeMode();
  }

  void _changeLocale(WidgetRef ref) {
    ref.read(localizationNotifierProvider.notifier).changeLocale();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
            floating: false,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () => _changeThemeMode(ref),
                icon: const Icon(
                  Icons.pets,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () => _changeLocale(ref),
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

import 'package:dog_friends/features/user/bloc/theme_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_widgets/nav_bar_widget.dart';

// class UserProfileScreen extends ConsumerWidget {
//   const UserProfileScreen({super.key});
//
//   void _changeThemeMode(WidgetRef ref) {
//     ref.read(themeNotifierProvider.notifier).changeThemeMode();
//   }
//
//   void _changeLocale(WidgetRef ref) {
//     ref.read(localizationNotifierProvider.notifier).changeLocale();
//   }

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeModeCubit theme =
        BlocProvider.of<ThemeModeCubit>(context, listen: false);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
            floating: false,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () => theme.changeThemeMode(),
                icon: const Icon(
                  Icons.dark_mode,
                  size: 30,
                ),
              ),
              // IconButton(
              //   onPressed: () => _changeLocale(ref),
              //   icon: const Icon(Icons.language),
              // )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "",
                // AppLocalizations.of(context)!.dogFriends,
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

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared_widgets/nav_bar_widget.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

// void _changeThemeMode(WidgetRef ref) {
//   ref.read(themeNotifierProvider.notifier).changeThemeMode();
// }
//
// void _changeLocale(WidgetRef ref) {
//   ref.read(localizationNotifierProvider.notifier).changeLocale();
// }

class _ChatScreenState extends ConsumerState<ChatScreen> {
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
              TextButton(
                // вивести в setting_screen _changeThemeMode/_changeLocale
                onPressed: () => context.push("/setting"),
                child: const Icon(
                  Icons.settings,
                  size: 30,
                ),
              ),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared_widgets/nav_bar_widget.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    // final ThemeMode mode = ref.watch(themeNotifierProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
            floating: false,
            pinned: true,
            actions: [
              TextButton(
                onPressed: () => context.push("/setting"),
                child: const Icon(
                  Icons.settings,
                  size: 30,
                ),
              ),
              // IconButton(
              //   onPressed: () => _changeLocale(ref),
              //   icon: const Icon(Icons.language),
              // )
            ],
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text(
            //     AppLocalizations.of(context)!.dogFriends,
            //     style: Theme.of(context).textTheme.headlineLarge,
            //   ),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Form(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}

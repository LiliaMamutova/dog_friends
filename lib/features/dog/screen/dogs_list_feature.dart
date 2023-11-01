import 'package:dog_friends/features/dog/dog_model/dog_model.dart';
import 'package:dog_friends/features/dog/provider_dogs/dog_provider.dart';
import 'package:dog_friends/features/dog/screen/dog_profile_screen.dart';
import 'package:dog_friends/shared_provider/theme_mode_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared_widgets/nav_bar_widget.dart';
import '../../user/service/dogs_api.dart';
import '../widgets/grid_dogs_widget.dart';
import '../widgets/list_dogs_widget.dart';

class DogsListScreen extends ConsumerStatefulWidget {
  const DogsListScreen({super.key});

  @override
  ConsumerState<DogsListScreen> createState() => _DogsListScreenState();
}

const mockImageUrl =
    "https://www.akc.org/wp-content/uploads/2017/11/Pembroke-Welsh-Corgi-standing-outdoors-in-the-fall.jpg";

class _DogsListScreenState extends ConsumerState<DogsListScreen> {
  final dogsApi = DogApi();
  List<DogModel> dogsList = [];
  bool isGridView = false;
  static const int minimalScreenWidth = 932;

  @override
  void initState() {
    super.initState();
  }

  void changeView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  void goToMessage(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => const MessageScreen()));
  }

  void goToDogsList(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => const DogsListFeature()));
  }

  void goToHome(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => const SearchScreen()));
  }

  void goToCreateDogScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DogProfileScreen(
          isNewDog: true,
        ),
      ),
    );
  }

  void _changeThemeMode() {
    ref.read(themeNotifierProvider.notifier).changeThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final bool isEnoughWidth =
        MediaQuery.sizeOf(context).width > minimalScreenWidth;
    final int columnsCount = isLandscape && isEnoughWidth ? 4 : 2;

    return Scaffold(
      bottomNavigationBar: const NavBar(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: goToCreateDogScreen,
        ),
        actions: [
          IconButton(
            onPressed: _changeThemeMode,
            icon: const Icon(
              Icons.pets,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: switch (ref.watch(dogsNotifierProvider)) {
          AsyncData(:final value) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: isLandscape
                  ? DogsGridWidget(
                      dogsList: value,
                      columnsCount: columnsCount,
                    )
                  : DogsListWidget(
                      dogsList: value,
                    ),
            ),
          AsyncError() => const Text("Some error occured"),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}

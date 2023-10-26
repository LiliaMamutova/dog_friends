import 'package:dog_friends/features/dog/dog_model/dog_model.dart';
import 'package:dog_friends/features/dog/screen/dog_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../shared_widgets/nav_bar_widget.dart';
import '../../user/service/dogs_api.dart';
import '../widgets/grid_dogs_widget.dart';
import '../widgets/list_dogs_widget.dart';

class DogsListScreen extends StatefulWidget {
  const DogsListScreen({super.key});

  @override
  State<DogsListScreen> createState() => _DogsListScreenState();
}

const mockImageUrl =
    "https://www.akc.org/wp-content/uploads/2017/11/Pembroke-Welsh-Corgi-standing-outdoors-in-the-fall.jpg";

class _DogsListScreenState extends State<DogsListScreen> {
  final dogsApi = DogApi();
  List<DogModel> dogsList = [];
  bool isGridView = false;
  static const int minimalScreenWidth = 932;

  @override
  void initState() {
    super.initState();
    getDogs();
  }

  Future<void> getDogs() async {
    print("trigger dogs");
    dogsList = await dogsApi.getDogsList();
    setState(() {
      dogsList = [...dogsList];
      print(dogsList);
    });
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

  void removeDog(int id) async {
    await dogsApi.deleteDog(id);
    setState(() {
      dogsList.removeWhere((element) => element.id == id);
    });
  }

  void goToCreateDogScreen() {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => DogProfileScreen(
          dog: DogModel(image: mockImageUrl),
          isNewDog: true,
        ),
      ),
    )
        .then((dog) {
      setState(() {});
      dogsList.add(dog);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final bool isEnoughWidth =
        MediaQuery.of(context).size.width > minimalScreenWidth;
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
            onPressed: changeView,
            icon: const Icon(
              Icons.pets,
              size: 45,
              color: Color(0xCE06284E),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: isLandscape
            ? DogsGridWidget(
                dogsList: dogsList,
                columnsCount: columnsCount,
              )
            : DogsListWidget(
                dogsList: dogsList,
                removeDog: removeDog,
              ),
      ),
    );
  }
}

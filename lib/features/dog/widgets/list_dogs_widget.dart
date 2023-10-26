import 'package:dog_friends/features/dog/screen/dog_profile_screen.dart';
import 'package:flutter/material.dart';

import '../dog_model/dog_model.dart';
import 'list_dog_card_widget.dart';

class DogsListWidget extends StatelessWidget {
  final List<DogModel> dogsList;
  final void Function(int id) removeDog;

  const DogsListWidget({
    super.key,
    required this.dogsList,
    required this.removeDog,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dogsList.length,
      itemBuilder: (BuildContext context, int index) {
        final DogModel item = dogsList[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DogProfileScreen(dog: item)));
          },
          child: ListDogCardWidget(
            item: item,
            removeDog: removeDog,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../dog_model/dog_model.dart';
import 'grid_dog_card_widget.dart';

class DogsGridWidget extends StatelessWidget {
  const DogsGridWidget({
    super.key,
    required this.dogsList,
    required this.columnsCount,
  });

  final List<DogModel> dogsList;
  final int columnsCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: dogsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnsCount,
        mainAxisExtent: 180,
      ),
      itemBuilder: (BuildContext context, int index) {
        final DogModel dog = dogsList[index];
        return GridDogCardWidget(dog: dog);
      },
    );
  }
}

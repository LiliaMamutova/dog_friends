import 'package:flutter/material.dart';

import '../dog_model/dog_model.dart';
import 'list_dog_card_widget.dart';

class DogsListWidget extends StatelessWidget {
  const DogsListWidget({
    super.key,
    required this.dogsList,
  });

  final List<DogModel> dogsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dogsList.length,
      itemBuilder: (BuildContext context, int index) {
        final DogModel item = dogsList[index];
        return GestureDetector(
          onTap: () {},
          child: ListDogCardWidget(item: item),
        );
      },
    );
  }
}

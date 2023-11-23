import 'package:dog_friends/features/dog/screen/dog_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../user/service/dogs_api.dart';
import '../dog_model/dog_model.dart';
import 'list_dog_card_widget.dart';

class DogsListWidget extends StatelessWidget {
  final List<DogModel> dogsList;
  final dogApi = DogApi();

  DogsListWidget({
    super.key,
    required this.dogsList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: dogsList.length,
            itemBuilder: (BuildContext context, int index) {
              final DogModel item = dogsList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DogProfileScreen(
                          isNewDog: false, id: item.id.toString()),
                    ),
                  );
                },
                child: ListDogCardWidget(
                  item: item,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../dog_model/dog_model.dart';

class ListDogCardWidget extends StatelessWidget {
  final DogModel item;
  final void Function(int id) removeDog;

  const ListDogCardWidget({
    super.key,
    required this.item,
    required this.removeDog,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: "avatar-${item.id}",
                    child: Image.network(
                      item.image,
                      width: 70,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      item.gender,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      item.breed,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                alignment: Alignment.centerRight,
                onPressed: () => removeDog(item.id),
                icon: const Icon(
                  Icons.restore_from_trash,
                  // size: 45,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

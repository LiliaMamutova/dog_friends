import 'package:dog_friends/features/dog/provider_dogs/dog_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dog_model/dog_model.dart';

class ListDogCardWidget extends ConsumerWidget {
  final DogModel item;

  const ListDogCardWidget({
    super.key,
    required this.item,
  });

  void removerDog(WidgetRef ref, DogModel dog) {
    ref.read(dogsNotifierProvider.notifier).removeDog(dog);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onPressed: () => removerDog(ref, item),
                // onPressed: () => removeDog(item.id),
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

import 'package:dog_friends/features/user/service/dogs_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dog_model/dog_model.dart';

class DogNotifier extends StateNotifier<AsyncValue<List<DogModel>>> {
  final DogRepository _dogApi;

  DogNotifier(this._dogApi) : super(AsyncValue.data([])) {
    getDogs();
  }

  void getDogs() async {
    try {
      final dogsList = await _dogApi.getDogsList();
      state = AsyncData(dogsList);
    } catch (e) {
      state = AsyncData([]);
    }
  }

  void removeDog(DogModel dog) async {
    final oldState = state.requireValue;
    state = const AsyncValue.loading();
    try {
      await _dogApi.deleteDog(dog.id);
      oldState.remove(dog);
      print(oldState);
      state = AsyncValue.data([...oldState]);
    } catch (error, stackTrace) {
      print(error);
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void createDog(DogModel dog) async {
    print(state.value);
    final oldState = state.value != null && state.value!.length > 0
        ? state.requireValue
        : [];
    state = const AsyncValue.loading();
    try {
      await _dogApi.createDog(dog);
      state = AsyncValue.data([...oldState, dog]);
      print(state.requireValue);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void editDog(DogModel dog) async {
    final oldState = state.requireValue;
    final dogIndex = oldState.indexOf(dog);

    oldState[dogIndex] = dog;
    state = const AsyncValue.loading();
    try {
      await _dogApi.editDog(dog);
      state = AsyncValue.data([...oldState]);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  DogModel getDogById(String id) {
    final dogs = state.requireValue;

    final dog = dogs.firstWhere((element) => element.id == id);
    return dog;
  }
}

final dogsProvider = Provider<DogRepository>((ref) => DogRepository());

final dogsNotifierProvider =
    StateNotifierProvider<DogNotifier, AsyncValue<List<DogModel>>>((ref) {
  DogRepository dogApiProvider = ref.read(dogsProvider);
  return DogNotifier(dogApiProvider);
});

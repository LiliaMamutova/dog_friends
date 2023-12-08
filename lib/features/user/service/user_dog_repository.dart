import 'package:dog_friends/features/user/service/general_provider.dart';

import '../../dog/dog_model/dog_model.dart';

abstract class BaseRepository {
  Future<Map<String, dynamic>?> getUserData();

  Future<String> getUserImage();

  Future<String> getDogsImage();

  Future<List<DogModel>> getDogsList();

  Future<void> createDog();

  Future<void> deleteDog();

  Future<void> editDog();
}

class UserDogRepository extends BaseRepository {
  final _read;

  UserDogRepository(this._read);

  @override
  Future<void> createDog() async {
    await _read(firebaseFirestoreProvider).createDog();
  }

  @override
  Future<void> deleteDog() async {
    await _read(firebaseFirestoreProvider).deleteDog();
  }

  @override
  Future<void> editDog() async {
    await _read(firebaseFirestoreProvider).editDog();
  }

  @override
  Future<List<DogModel>> getDogsList() {
    return _read(firebaseFirestoreProvider).getDogsList();
  }

  @override
  Future<Map<String, dynamic>?> getUserData() {
    return _read(firebaseFirestoreProvider).getUserData();
  }

  @override
  Future<String> getUserImage() {
    return _read(firebaseStorageProvider).getUserImage();
  }

  @override
  Future<String> getDogsImage() {
    return _read(firebaseStorageProvider).getDogsImage();
  }
}

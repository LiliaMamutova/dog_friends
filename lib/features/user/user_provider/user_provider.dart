import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/user_api.dart';

class UserNotifier extends StateNotifier<UserCredential?> {
  final userApi = UserRepository();

  UserNotifier() : super(null);

  void setUserCredential(UserCredential userCredential) {
    state = userCredential;
  }

  UserCredential? getUserCredential() {
    return state;
  }
}

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserCredential?>(
        (ref) => UserNotifier());

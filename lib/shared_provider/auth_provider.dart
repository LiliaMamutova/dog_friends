import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/models/user.model.dart';

class UserProvider extends StateNotifier<UserAuthData> {
  UserProvider() : super(UserAuthData());

  void updateUserAuthData(UserAuthData userAuthData) {
    state = userAuthData;
  }
}

final userProvider =
    StateNotifierProvider<UserProvider, UserAuthData>((ref) => UserProvider());

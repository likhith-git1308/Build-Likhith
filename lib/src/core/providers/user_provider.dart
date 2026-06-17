import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';

final userProvider = StateNotifierProvider<UserNotifier, AsyncValue<UserModel?>>(
  (ref) => UserNotifier(),
);

class UserNotifier extends StateNotifier<AsyncValue<UserModel?>> {
  UserNotifier() : super(const AsyncValue.data(null));

  Future<void> setUser(UserModel user) async {
    state = AsyncValue.data(user);
  }

  Future<void> clearUser() async {
    state = const AsyncValue.data(null);
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState.unauthenticated());

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = AuthState.authenticated(token: 'sample_token_$email');
    } catch (e) {
      state = AuthState.error(message: e.toString());
    }
  }

  Future<void> signup(String email, String password, String name) async {
    state = const AuthState.loading();
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = AuthState.authenticated(token: 'sample_token_$email');
    } catch (e) {
      state = AuthState.error(message: e.toString());
    }
  }

  Future<void> logout() async {
    state = const AuthState.unauthenticated();
  }
}

class AuthState {
  final String? token;
  final String? message;
  final bool isLoading;
  final bool isAuthenticated;

  const AuthState({
    this.token,
    this.message,
    this.isLoading = false,
    this.isAuthenticated = false,
  });

  const AuthState.unauthenticated()
      : token = null,
        message = null,
        isLoading = false,
        isAuthenticated = false;

  const AuthState.loading()
      : token = null,
        message = null,
        isLoading = true,
        isAuthenticated = false;

  const AuthState.authenticated({required String token})
      : this.token = token,
        message = null,
        isLoading = false,
        isAuthenticated = true;

  const AuthState.error({required String message})
      : token = null,
        message = message,
        isLoading = false,
        isAuthenticated = false;
}
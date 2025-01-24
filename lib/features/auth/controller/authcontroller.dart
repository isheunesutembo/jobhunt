import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jobhunt/features/auth/models/usermodel.dart';
import 'package:jobhunt/providers/currentusernotifier.dart';
import 'package:jobhunt/features/auth/repository/authrepository.dart';
import 'package:jobhunt/features/auth/repository/localauthrepository.dart';
import 'package:jobhunt/util/utils.dart';

final authControllerProvider =
    AsyncNotifierProvider<AuthContoller, AsyncValue<void>>(AuthContoller.new);
final getCurrentUserProvider =
    FutureProvider.family<UserModel, String>((ref, String userId) {
  final auth = ref.watch(authControllerProvider.notifier);
  return auth.getCurrentUser(userId);
});

class AuthContoller extends AsyncNotifier<AsyncValue<void>> {
  late AuthRepository _authRepository;
  late LocalAuthRepository _localAuthRepository;

  @override
  AsyncValue<void> build() {
    _authRepository = ref.watch(authRepositoryProvider);
    _localAuthRepository = ref.watch(localAuthRepositoryProvider);

    return const AsyncValue.data(null);
  }

  Future<void> logInWithEmailPassword(
      String email, String password, BuildContext context) async {
    final user = await _authRepository.logInWithEmailPassword(email, password);
    final val = switch (user) {
      Left(value: final l) => showSnackBar(context, l.message),
      Right(value: final r) => Navigator.pushNamed(context, "/mainscreen")
    };
  }

  Future<void> registerWithEmailPassword(String email, String username,
      String password, BuildContext context) async {
    final user = await _authRepository.registerWithEmailPassword(
        email, username, password);

    final val = switch (user) {
      Left(value: final l) => showSnackBar(context, l.toString()),
      Right(value: final r) => Navigator.pushNamed(context, "/signinscreen")
    };
  }

  Future<UserModel> getCurrentUser(String userId) async {
    final res = await _authRepository.getCurrentUserData(userId);
    return switch (res) {
      Left(value: final l) => throw l,
      Right(value: final r) => r
    };
  }
}

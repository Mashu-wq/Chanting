import 'package:chanting/features/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(
    authRepository: authRepository,
  );
});

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  // Corrected method name
  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  void verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String userOTP}) {
    authRepository.verifyOTP(
        context: context, verificationId: verificationId, userOTP: userOTP);
  }
}

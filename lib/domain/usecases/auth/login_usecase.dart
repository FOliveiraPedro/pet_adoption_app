import '../../../shared/shared.dart' show Json;

abstract class AuthLoginUseCase {
  Future<void> call({required final AuthLoginUseCaseParams params});
}

class AuthLoginUseCaseParams {
  final String access;
  final String password;
  final Json deviceInfo;

  AuthLoginUseCaseParams({
    required this.access,
    required this.password,
    required this.deviceInfo,
  });
}

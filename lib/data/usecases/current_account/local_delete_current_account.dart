import '../../../domain/helpers/helpers.dart' show DomainErrorExtension;
import '../../../domain/usecases/usecases.dart' show DeleteCurrentAccountUseCase;
import '../../cache/cache.dart' show DeleteSecureCacheStorage;
import '../../errors/errors.dart' show CacheError;

class LocalDeleteCurrentAccount implements DeleteCurrentAccountUseCase {
  final DeleteSecureCacheStorage deleteSecureCacheStorage;

  LocalDeleteCurrentAccount({required this.deleteSecureCacheStorage});

  @override
  Future<void> call() async {
    try {
      await deleteSecureCacheStorage.deleteSecure(key: 'account');
    } on CacheError catch (error) {
      throw error.toDomainError();
    }
  }
}

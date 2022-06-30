import 'dart:convert';

import '../../../domain/entities/entities.dart' show AccountEntity;
import '../../../domain/helpers/helpers.dart' show DomainErrorExtension;
import '../../../domain/usecases/usecases.dart' show SaveCurrentAccountUseCase;
import '../../cache/cache.dart' show SaveSecureCacheStorage;
import '../../errors/errors.dart' show CacheError, ModelError;
import '../../models/models.dart' show LocalAccountModel;

class LocalSaveCurrentAccount implements SaveCurrentAccountUseCase {
  final SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentAccount({required this.saveSecureCacheStorage});

  @override
  Future<void> call({required final AccountEntity account}) async {
    try {
      final String stringifiedAccount = jsonEncode(LocalAccountModel.fromDomain(entity: account).toJson());
      await saveSecureCacheStorage.saveSecure(key: 'account', value: stringifiedAccount);
    } on CacheError catch (error) {
      throw error.toDomainError();
    } on ModelError catch (error) {
      throw error.toDomainError();
    }
  }
}

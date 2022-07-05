import 'dart:convert';

import '../../../domain/entities/entities.dart' show AccountEntity;
import '../../../domain/helpers/helpers.dart' show DomainErrorExtension;
import '../../../domain/usecases/usecases.dart' show FetchCurrentAccountUseCase;
import '../../../shared/shared.dart' show Json;
import '../../cache/cache.dart' show FetchSecureCacheStorage;
import '../../errors/errors.dart' show CacheError, ModelError;
import '../../models/models.dart' show LocalAccountModel;

class LocalFetchCurrentAccount implements FetchCurrentAccountUseCase {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LocalFetchCurrentAccount({required this.fetchSecureCacheStorage});

  @override
  Future<AccountEntity> call() async {
    try {
      final String stringfiedAccount = await fetchSecureCacheStorage.fetchSecure(key: 'account');
      return LocalAccountModel.fromJson(json: jsonDecode(stringfiedAccount) as Json).toEntity();
    } on CacheError catch (error) {
      throw error.toDomainError();
    } on ModelError catch (error) {
      throw error.toDomainError();
    }
  }
}

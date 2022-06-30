import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

FetchCurrentAccountUseCase makeLocalFetchCurrentAccount() => LocalFetchCurrentAccount(
      fetchSecureCacheStorage: makeLocalStorageAdapter(),
    );

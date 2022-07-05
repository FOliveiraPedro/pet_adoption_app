import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

SaveCurrentAccountUseCase makeLocalSaveCurrentAccount() => LocalSaveCurrentAccount(
      saveSecureCacheStorage: makeLocalStorageAdapter(),
    );

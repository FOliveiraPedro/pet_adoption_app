import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

// TODO(Team): Levar para discussão com o time (Comentar sobre o composite. Ex: Uso do fallback)
AuthLoginUseCase makeRemoteAuthLoginUseCase() => RemoteAuthLogin(
      client: makeDioAdapter(),
      url: makeApiUrl(path: 'auth/mobile-login'),
    );

// AuthLoginUseCase makeLocalAuthLoginUseCase() => LocalAuthLogin();

import '../../../data/http/http.dart';
import '../../decorators/decorators.dart';
import '../../factories/factories.dart';

HttpClient makeAuthorizeDioClientDecorator() => AuthorizeDioClientDecorator(
      decoratee: makeDioAdapter(),
      fetchCurrentAccount: makeLocalFetchCurrentAccount(),
      deleteCurrentAccount: makeLocalDeleteCurrentAccount(),
    );

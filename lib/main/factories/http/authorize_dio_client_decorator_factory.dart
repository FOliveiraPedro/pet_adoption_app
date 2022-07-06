import '../../../data/http/http.dart';
import '../../decorators/decorators.dart';
import '../../factories/factories.dart';

HttpClient makeAuthorizeDioClientDecorator({Duration? timeout}) => AuthorizeDioClientDecorator(
  decoratee: makeDioAdapter(
    timeout: timeout,
  ),
);

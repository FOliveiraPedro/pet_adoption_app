import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

SearchCatBreedsUsecase makeRemoteSearchCatBreeds() => RemoteSearchCatBreeds(
  url: makeApiUrl(path: 'https://api.thecatapi.com/v1/breeds'),
  client: makeAuthorizeDioClientDecorator(
    timeout: const Duration(seconds: 15),
  ),
);

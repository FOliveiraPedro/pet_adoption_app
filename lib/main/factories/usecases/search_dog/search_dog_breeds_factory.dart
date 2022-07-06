import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

SearchDogBreedsUsecase makeRemoteSearchDogBreeds() => RemoteSearchDogBreeds(
  url: makeApiUrl(path: 'https://api.thedogapi.com/v1/breeds'),
  client: makeAuthorizeDioClientDecorator(
    timeout: const Duration(seconds: 15),
  ),
);

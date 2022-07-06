

import '../../entities/entities.dart';

abstract class SearchDogBreedsUsecase {
  Future<List<AnimalEntity>> call();
}
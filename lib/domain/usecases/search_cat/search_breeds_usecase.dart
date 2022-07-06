import '../../entities/entities.dart';

abstract class SearchCatBreedsUsecase {
  Future<List<AnimalEntity>> call();
}
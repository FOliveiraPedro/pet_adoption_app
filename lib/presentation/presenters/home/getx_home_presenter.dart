import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../main/routes/routes.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxHomePresenter extends GetxController
    with UIErrorManager
    implements HomePresenter {
  final SearchDogBreedsUsecase searchDogBreedsUsecase;
  final SearchCatBreedsUsecase searchCatBreedsUsecase;
  final AppNavigator appNavigator;

  GetxHomePresenter({
    required this.searchDogBreedsUsecase,
    required this.searchCatBreedsUsecase,
    required this.appNavigator,
  });

  List<AnimalEntity> auxCatBreeds = [];
  List<AnimalEntity> auxDogBreeds = [];

  Rx<List<AnimalEntity>> animalBreeds = Rx([]);

  @override
  Stream<List<AnimalEntity>> get animalBreedsStream => animalBreeds.stream;

  @override
  Future<void> getBreedList() async {
    auxCatBreeds = await searchCatBreedsUsecase();
    animalBreeds.value = auxCatBreeds;
    auxDogBreeds = await searchDogBreedsUsecase();

    animalBreeds.value = auxCatBreeds + auxDogBreeds;
  }

  @override
  void goToDetails(AnimalEntity animalEntity) {
    appNavigator
        .pushNamed(AppRoutes.details, arguments: {'animal': animalEntity});
  }
}

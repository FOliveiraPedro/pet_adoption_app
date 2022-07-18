import '../../../domain/entities/entities.dart';
import '../../helpers/helpers.dart';

abstract class HomePresenter {
  Stream<UIError> get snackbarErrorStream;

  Stream<List<AnimalEntity>> get animalBreedsStream;
  Future<void> getBreedList();

  void goToDetails(AnimalEntity animalEntity);
}

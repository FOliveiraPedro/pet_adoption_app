import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';
import '../../usecases/search_cat/search_cat.dart';

HomePresenter makeGetxHomePresenter() => GetxHomePresenter(
  searchDogBreedsUsecase: makeRemoteSearchDogBreeds(),
  searchCatBreedsUsecase: makeRemoteSearchCatBreeds(),
  appNavigator: makeAppNavigator(),
);

import '../../../../presentation/presenters/presenters.dart';
import '../../factories.dart';

GetxDetailsPresenter makeGetxDetailsPresenter() => GetxDetailsPresenter(
  appNavigator: makeAppNavigator(),
);

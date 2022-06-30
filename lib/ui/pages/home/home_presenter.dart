import '../../helpers/helpers.dart';

abstract class HomePresenter {
  Stream<UIError> get snackbarErrorStream;
}

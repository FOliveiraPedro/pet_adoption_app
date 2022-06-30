import '../../helpers/helpers.dart';

abstract class LoginPresenter {
  Stream<UIError> get snackbarErrorStream;
}

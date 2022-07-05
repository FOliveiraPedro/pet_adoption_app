import '../../helpers/helpers.dart';

abstract class LoginPresenter {
  Stream<UIError> get snackbarErrorStream;

  void validadeEmail(String email);

  void validadePassword(String password);

  Future login();

  void goToHome();
}

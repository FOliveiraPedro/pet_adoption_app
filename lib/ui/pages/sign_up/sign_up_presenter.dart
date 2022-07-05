import '../../helpers/helpers.dart';

abstract class SignUpPresenter {
  Stream<UIError> get snackbarErrorStream;

  void validateEmail(String email);

  void validatePassword(String password);

  String? validateConfirmPassword(String password);

  Future signUp();
}

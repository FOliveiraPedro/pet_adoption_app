import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/usecases.dart';
import '../../../main/routes/routes.dart';
import '../../../ui/components/components.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxSignUpPresenter extends GetxController with UIErrorManager implements SignUpPresenter {
  final AuthLoginUseCase authLoginUseCase;
  final AppNavigator appNavigator;

  GetxSignUpPresenter({
    required this.authLoginUseCase,
    required this.appNavigator
  });

  String email = '';
  String password = '';

  @override
  void validateEmail(String email){
    this.email = email;
  }

  @override
  void validatePassword(String password) {
    this.password = password;
  }

  @override
  Future<bool> signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbarError(message: 'No user found for that email.');
        print('No user found for that email.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        showSnackbarError(message: 'The account already exists for that email.');
        print('The account already exists for that email.');
        return false;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }



  @override
  void goToSignUp() {
    appNavigator.pushNamed(
      AppRoutes.signUp,
    );  }

  @override
  String? validateConfirmPassword(String password) {
    if(password != this.password){
      return 'As senhas devem ser iguais';
    }
    return null;
  }
}

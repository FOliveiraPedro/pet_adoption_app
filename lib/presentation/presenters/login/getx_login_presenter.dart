import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../main/routes/routes.dart';
import '../../../ui/components/components.dart';
import '../../../ui/pages/pages.dart';
import '../../helpers/helpers.dart';
import '../../mixins/mixins.dart';

class GetxLoginPresenter extends GetxController with UIErrorManager implements LoginPresenter {
  final AppNavigator appNavigator;

  GetxLoginPresenter({

    required this.appNavigator
  });

  String email = '';
  String password = '';

  @override
  void validadeEmail(String email){
    this.email = email;
  }

  @override
  void validadePassword(String password) {
    this.password = password;
  }

  @override
  Future<bool> login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbarError(message: 'No user found for that email.');
        print('No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        showSnackbarError(message: 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
        return false;
      }
      return false;
    }
  }

  @override
  void goToHome(){
    appNavigator.pushNamed(
      AppRoutes.homePage,
    );
  }

  @override
  void goToSignUp() {
    appNavigator.pushNamed(
      AppRoutes.signUp,
    );
  }
}

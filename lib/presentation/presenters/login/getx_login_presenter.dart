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
  final AuthLoginUseCase authLoginUseCase;
  final AppNavigator appNavigator;

  GetxLoginPresenter({
    required this.authLoginUseCase,
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
  Future<void> login() async {
    print(email);
    print(password);
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(userCredential.user != null){
        goToHome();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbarError(message: 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackbarError(message: 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void goToHome(){
    appNavigator.pushNamed(
      AppRoutes.homePage,
    );
  }



}

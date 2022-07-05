import 'package:get/get.dart';

import '../../../main/routes/routes.dart';
import '../../../ui/pages/pages.dart';

class GetxSplashPresenter extends GetxController implements SplashPresenter {
  final AppNavigator appNavigator;

  GetxSplashPresenter({required this.appNavigator});

  @override
  void goToLogin() {
    appNavigator.pushNamed(
      AppRoutes.loginPage,
    );
  }
}

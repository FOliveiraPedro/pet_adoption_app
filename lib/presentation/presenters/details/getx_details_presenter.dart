import 'package:get/get.dart';


import '../../../main/routes/routes.dart';
import '../../../ui/pages/pages.dart';
import '../../mixins/mixins.dart';

class GetxDetailsPresenter extends GetxController with UIErrorManager implements DetailsPresenter {
  final AppNavigator appNavigator;

  GetxDetailsPresenter({
    required this.appNavigator
  });

  @override
  void goToSignUp() {
    appNavigator.pushNamed(
      AppRoutes.signUp,
    );
  }
}

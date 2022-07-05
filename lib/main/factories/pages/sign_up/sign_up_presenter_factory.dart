import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

SignUpPresenter makeGetxSignUpPresenter() => GetxSignUpPresenter(
  authLoginUseCase: makeRemoteAuthLoginUseCase(),
  appNavigator: makeAppNavigator(),
);

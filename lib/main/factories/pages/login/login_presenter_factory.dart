import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

LoginPresenter makeGetxLoginPresenter() => GetxLoginPresenter(
      authLoginUseCase: makeRemoteAuthLoginUseCase(),
      appNavigator: makeAppNavigator(),
    );

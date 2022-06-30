import 'package:get/get.dart';

import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../ui/pages/pages.dart';
import '../../helpers/helpers.dart';
import '../../mixins/mixins.dart';

class GetxLoginPresenter extends GetxController with UIErrorManager implements LoginPresenter {
  final AuthLoginUseCase authLoginUseCase;

  GetxLoginPresenter({
    required this.authLoginUseCase,
  });

  Future<void> login() async {
    try {
      await authLoginUseCase.call(
        params: AuthLoginUseCaseParams(
          access: '',
          password: '',
          deviceInfo: {},
        ),
      );
    } on DomainError catch (error) {
      snackbarError = error.fromDomain;
      // '${error.message} [${error.code}]';
    }
  }
}

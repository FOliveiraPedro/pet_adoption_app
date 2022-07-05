import '../components/components.dart';
import '../helpers/helpers.dart';

mixin UIErrorManager {
  void handleDialogErrorStream({required final Stream<UIError> stream}) {
    stream.listen((final event) {
      if (event.code != UIErrorCode.noError) {
        showDialogError(message: event.description);
      }
    });
  }

  void handleSnackbarErrorStream({required final Stream<UIError> stream}) {
    stream.listen((final event) {
      if (event.code != UIErrorCode.noError) {
        showSnackbarError(message: event.description);
      }
    });
  }
}

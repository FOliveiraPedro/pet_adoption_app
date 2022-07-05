import 'package:get/get.dart';

abstract class AppNavigator {
  /// Push a named route on top of current page
  Future<T?> pushNamed<T extends Object>(String routeName, {Object? arguments});

  /// Navigate to a named route and clear the stack (delete all previous routes from the stack)
  void navigate(String routeName, {Object? arguments});

  /// Pop current page
  void pop<T extends Object>({T? result});
}

class GetxAppNavigator implements AppNavigator {
  @override
  void navigate(String routeName, {Object? arguments}) {
    Get.offAllNamed(routeName, arguments: arguments);
  }

  @override
  void pop<T extends Object>({T? result}) {
    Get.back(result: result);
  }

  @override
  Future<T?> pushNamed<T extends Object>(
    String routeName, {
    Object? arguments,
  }) =>
      Get.toNamed<T?>(routeName, arguments: arguments) ?? Future.value();
}

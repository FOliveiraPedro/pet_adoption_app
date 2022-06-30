import 'package:flutter/material.dart';

import '../pages.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  const LoginPage({
    final Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Login'),
        ),
      );
}

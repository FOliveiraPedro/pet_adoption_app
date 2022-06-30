import 'package:flutter/material.dart';

import '../pages.dart';

class SplashPage extends StatelessWidget {
  final SplashPresenter presenter;

  const SplashPage({
    final Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Splash'),
        ),
      );
}

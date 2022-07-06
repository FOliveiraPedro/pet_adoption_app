import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../pages.dart';

class SplashPage extends StatefulWidget {
  final SplashPresenter presenter;

  const SplashPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      widget.presenter.goToLogin();
    });
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Text('Splash'),
        ),
      );
}

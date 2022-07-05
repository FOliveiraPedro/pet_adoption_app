import 'package:flutter/material.dart';

import '../../mixins/mixins.dart';
import '../pages.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({
    final Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with UIErrorManager {
  late final ScrollController _customScrollViewController;

  @override
  void initState() {
    super.initState();

    handleSnackbarErrorStream(stream: widget.presenter.snackbarErrorStream);

    _customScrollViewController = ScrollController();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: MediaQuery.of(context).viewPadding,
          child: CustomScrollView(
            controller: _customScrollViewController,
            physics: const BouncingScrollPhysics(),
            slivers: const [
              SliverPadding(
                padding: EdgeInsets.all(24),
                sliver: SliverToBoxAdapter(
                  child: Text('Home Page'),
                ),
              ),
            ],
          ),
        ),
      );
}

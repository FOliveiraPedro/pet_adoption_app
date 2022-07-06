import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/entities.dart';
import '../../mixins/mixins.dart';
import '../../theme/theme.dart';
import '../pages.dart';
import 'components/components.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with UIErrorManager {
  late final ScrollController _customScrollViewController;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  void initState() {
    super.initState();

    handleSnackbarErrorStream(stream: widget.presenter.snackbarErrorStream);

    _customScrollViewController = ScrollController();

    widget.presenter.getBreedList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Pet Breeds',
            style: GoogleFonts.workSans(
              color: AppColors.neutral7,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<List<AnimalEntity>>(
                  stream: widget.presenter.animalBreedsStream,
                  builder: (context, snapshot) => snapshot.hasData
                      ? Container(
                          height: MediaQuery.of(context).size.height-80,
                          child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: (){

                              },
                              child: AnimalCard(
                                name: snapshot.data![index].name,
                                origin: snapshot.data![index].origin,
                                lifeSpan: snapshot.data![index].lifeSpan,
                                imageUrl: snapshot.data![index].imageUrl,
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),),
            ],
          ),
        ),
        // drawer: Drawer(
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: [
        //       const DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //         child: Text('Drawer Header'),
        //       ),
        //       ListTile(
        //         title: const Text('Item 1'),
        //         onTap: () {},
        //       ),
        //       ListTile(
        //         title: const Text('Item 2'),
        //         onTap: () {},
        //       ),
        //     ],
        //   ),
        // )
      );
}

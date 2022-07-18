import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/entities/entities.dart';
import '../../../presentation/presenters/presenters.dart';
import '../../theme/theme.dart';

class DetailsPage extends StatelessWidget {
  final GetxDetailsPresenter presenter;
  final AnimalEntity animalEntity;

  const DetailsPage(
      {Key? key, required this.presenter, required this.animalEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            animalEntity.name,
            style: GoogleFonts.workSans(
              color: AppColors.neutral7,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                child: Image.network(
                  animalEntity.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                animalEntity.description,
                style: GoogleFonts.workSans(
                  color: AppColors.neutral0,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Originate from ' + animalEntity.origin,
                style: GoogleFonts.workSans(
                  color: AppColors.neutral0,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Life-span of ' + animalEntity.lifeSpan + ' years',
                style: GoogleFonts.workSans(
                  color: AppColors.neutral0,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
}

import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../ui/pages/pages.dart';
import 'details.dart';

Widget makeDetailsPage({required AnimalEntity animalEntity}) => DetailsPage(
      presenter: makeGetxDetailsPresenter(),
      animalEntity: animalEntity,
    );

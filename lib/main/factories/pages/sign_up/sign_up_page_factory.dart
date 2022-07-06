import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import 'sign_up.dart';

Widget makeSignUpPage() => SignUpPage(presenter: makeGetxSignUpPresenter());

import 'package:flutter_dotenv/flutter_dotenv.dart';

String makeApiUrl({required final String path}) => '${dotenv.env['URL_ENV']}/$path';

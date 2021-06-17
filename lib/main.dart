import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';
import 'package:qrscan/data/db/wms_database.dart';
import 'package:qrscan/presentation/qrscan_app.dart';
import 'di/get_it.dart' as getIt;
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  await WmsDatabase().database;
  runApp(MyApp());
}

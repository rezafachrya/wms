import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';
import 'package:qrscan/presentation/qrscan_app.dart';
import 'di/get_it.dart' as getIt;
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(MyApp());
}

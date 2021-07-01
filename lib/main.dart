import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedantic/pedantic.dart';
import 'package:qrscan/data/db/wms_database.dart';
import 'package:qrscan/presentation/qrscan_app.dart';
import 'di/get_it.dart' as getIt;
import 'package:flutter/services.dart';

import 'presentation/utility/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  await WmsDatabase().database;
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

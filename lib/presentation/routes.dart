import 'package:flutter/material.dart';
import 'package:qrscan/common/constants/constants.dart';
import 'package:qrscan/presentation/journeys/item/item.dart';
import 'package:qrscan/presentation/journeys/manifest_list/manifest_list.dart';
import 'package:qrscan/presentation/journeys/pages.dart';
import 'package:qrscan/presentation/journeys/scan/scan.dart';

import 'journeys/home/home.dart';
import 'journeys/login/login.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.splashScreen: (context) => SplashScreen(),
        RouteList.initial: (context) => LoginScreen(),
        RouteList.home: (context) => HomeScreen(),
        RouteList.scanScreen: (context) => ScanScreen(),
        RouteList.itemScreen: (context) => ItemScreen(
              arguments: setting.arguments as ItemArguments,
            ),
        RouteList.manifestListScreen: (context) => ManifestListScreen(),
      };
}

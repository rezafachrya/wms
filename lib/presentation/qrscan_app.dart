import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qrscan/common/constants/constants.dart';
import 'package:qrscan/common/screenutil/screenutil.dart';
import 'package:qrscan/common/themes/themes.dart';
import 'package:qrscan/di/get_it.dart';
import 'package:qrscan/presentation/routes.dart';

import 'cubits/loading/loading_cubit.dart';
import 'cubits/login/login_cubit.dart';
import 'fade_page_route_builder.dart';
import 'journeys/loading/loading_screen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginCubit loginCubit;
  LoadingCubit loadingCubit;

  @override
  void initState() {
    super.initState();
    loginCubit = getItInstance<LoginCubit>();
    loadingCubit = getItInstance<LoadingCubit>();
  }

  @override
  void dispose() {
    loginCubit?.close();
    loadingCubit?.close();
    // scanqrCubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>.value(value: loginCubit),
        BlocProvider<LoadingCubit>.value(value: loadingCubit),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qr App',
        theme: ThemeData(
          unselectedWidgetColor: ThemeColor.royalBlue,
          primaryColor: ThemeColor.vulcan,
          accentColor: ThemeColor.royalBlue,
          scaffoldBackgroundColor: ThemeColor.vulcan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        builder: (context, child) {
          // return child;
          return LoadingScreen(
            screen: child,
          );
        },
        initialRoute: RouteList.initial,
        onGenerateRoute: (settings) {
          final routes = Routes.getRoutes(settings);
          final WidgetBuilder builder = routes[settings.name];
          return FadePageRouteBuilder(
            builder: builder,
            settings: settings,
          );
        },
      ),
    );
  }
}

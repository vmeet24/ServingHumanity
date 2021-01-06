import 'package:flutter/material.dart';
import 'package:serving_humanity/app/router.gr.dart';
import 'package:serving_humanity/services/analytics_service.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            buttonTheme: ButtonThemeData(buttonColor: Color(0xffEE3E42)),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Color(0xffEE3E42)),
            scaffoldBackgroundColor: Color(0xffFFFFFF),
            primaryColorDark: Color(0xffFFFFFF),
            primaryColorLight: Color(0xffFFFFFF),
            primaryColor: Color(0xffFFFFFF),
            primaryTextTheme: TextTheme(
              headline5: TextStyle(color: Color(0xff000000)),
              headline6: TextStyle(color: Color(0xff000000)),
              bodyText1: TextStyle(
                color: Color(0xff000000),
              ),
            ),
            iconTheme: IconThemeData(color: Color(0xff757575)),
            dividerColor: Color(0xff757575)),
        navigatorObservers: [
          locator<AnalyticsService>().getAnalyticsObserver()
        ],
        initialRoute: Routes.startUpRoute,
        onGenerateRoute: Router().onGenerateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey);
  }
}
